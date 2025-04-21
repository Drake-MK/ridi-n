extends CharacterBody2D


const SPEED = 100.0
const DASH_SPEED = 200
const JUMP_VELOCITY = -400.0
@onready var anim = $AnimatableBody2D

enum States {left,right}
var current_state

var started_moving := false
var direction
var dashing := false


func _ready():
	
	started_moving = false
	dashing = false
	current_state = States.right
	
func _process(delta):
	
	match current_state:
		States.left:anim.play("left")
		States.right:anim.play("right")
		
		
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_ceiling():print('cealing')
	# Handle jump.


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("left", "right")
	
	if direction:
		if direction > 0:
			current_state = States.right
		else : 
			current_state = States.left
		if dashing :
			velocity.x = direction * SPEED * 4
		else :
			velocity.x = direction * SPEED
	
	if started_moving and velocity.x == 0 and velocity.y == 0 :
		GlobalBeings.emit_signal("stopped_moving")
		started_moving = false
	elif velocity.x != 0:
		started_moving = true

	move_and_slide()
	
func _input(event):
	if Input.is_action_just_pressed("dash"):
		dashing = !dashing
