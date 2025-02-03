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
