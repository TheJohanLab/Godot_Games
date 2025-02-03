extends Node2D

@onready var player = $Player
@onready var start = $Start

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	if player != null:
		player.global_position = start.get_spawn_pos()


func reset_player():
	player.velocity = Vector2.ZERO
	player.global_position = start.get_spawn_pos()
	


func _on_end_body_entered(body: Node2D) -> void:
	if body == player:
		reset_player()


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("walls"):
		reset_player()
