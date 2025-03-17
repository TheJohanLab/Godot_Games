extends CharacterBody2D
class_name Player

@onready var hit_timer=$hit_cooldown
@onready var bonk_timer=$bonk_cooldown
const SPEED = 300.0
const ROTATION_SPEED = 1.0
const JUMP_VELOCITY = -400.0
var hittable = true
var bonk = false
var direction_rotation = 1 
var direction
var last_direction

func _physics_process(delta: float) -> void:
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		
	direction = Input.get_vector("left","right","up", "down")
	
	if direction != Vector2(0,0):
		last_direction=direction
	if !bonk:	
		velocity = direction * SPEED
	else:
		velocity = -last_direction * SPEED
	rotation += ROTATION_SPEED * delta * direction_rotation
	move_and_slide()

func start_hit_timer():
	hit_timer.start()

func start_bonk_timer():
	bonk_timer.start()

func player_hit():
	rotation -= ROTATION_SPEED * 0.3 * direction_rotation

func change_rotation():
	direction_rotation = -direction_rotation 


func _on_hit_cooldown_timeout() -> void:
	hittable = true


func _on_bonk_cooldown_timeout() -> void:
	bonk = false
