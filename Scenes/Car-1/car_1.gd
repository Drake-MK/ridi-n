extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

enum States  {UP,DOWN,LEFT,RIGHT}
var current_state 

func _ready():
	current_state = States.UP

func _process(delta):
	match current_state:
		States.UP:pass
		States.DOWN:pass
		States.RIGHT:pass
		States.LEFT:pass
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * SPEED
		current_state = States.LEFT
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		current_state = States.RIGHT

	move_and_slide()
