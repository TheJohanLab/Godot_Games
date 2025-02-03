extends Sprite2D

@onready var spawn_mark = $Spawn

func get_spawn_pos():
	return spawn_mark.global_position
