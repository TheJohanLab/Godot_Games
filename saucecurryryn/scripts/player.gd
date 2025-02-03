extends CharacterBody2D


const SPEED = 300.0
const ROTATION_SPEED = 1.0
const JUMP_VELOCITY = -400.0

 
func _physics_process(delta: float) -> void:
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		
	var direction = Input.get_vector("left","right","up", "down")	
	velocity = direction * SPEED
	rotation += ROTATION_SPEED * delta
	move_and_slide()
