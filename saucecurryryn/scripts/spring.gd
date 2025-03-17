extends Area2D

@onready var animated_sprite = $AnimatedSprite2D



func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if body.hittable:
			body.hittable = false
			animated_sprite.play("spring")
			body.change_rotation()
			body.player_hit()
			body.start_hit_timer()
