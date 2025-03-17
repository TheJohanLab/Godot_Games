extends CharacterBody2D

@onready var timer=$hit_cooldown
const SPEED = 300.0
const ROTATION_SPEED = 1.0
const JUMP_VELOCITY = -400.0
var hittable = true
 
func _physics_process(delta: float) -> void:
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		
	var direction = Input.get_vector("left","right","up", "down")	
	velocity = direction * SPEED
	rotation += ROTATION_SPEED * delta
	move_and_slide()

func start_timer():
	timer.start()

func _on_hit_cooldown_timeout() -> void:
	hittable = true
