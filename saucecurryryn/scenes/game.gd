extends Node2D

@onready var player = $Player
@onready var start = $Start
@onready var HPlabel = $UIlayer/hud
@export	var HP_max = 3
var current_HP = HP_max

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	if player != null:
		player.global_position = start.get_spawn_pos()
	reset_hp()

func reset_player():
	player.velocity = Vector2.ZERO
	player.global_position = start.get_spawn_pos()
	reset_hp()
	


func _on_end_body_entered(body: Node2D) -> void:
	if body == player:
		reset_player()


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("walls") and player.hittable:
		player.hittable = false
		player.bonk = true
		current_HP -= 1
		HPlabel.set_hp_label(current_HP)
		player.player_hit()
		player.start_hit_timer()
		player.start_bonk_timer()
		if current_HP <= 0:
			reset_player()


func reset_hp():
	current_HP= HP_max
	HPlabel.set_hp_label(current_HP)
	
