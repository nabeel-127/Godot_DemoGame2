extends CharacterBody2D

const max_speed = 100
const acceleration = 500
const friction = 1000
var input = Vector2.ZERO

func _physics_process(delta):
	PlayerMovement(delta)
	move_and_slide()
	
# 	if Input.is_action_pressed("ui_right"):
# 		velocity.x += 10
# 	if Input.is_action_pressed("ui_left"):
# 		velocity.x -= 10
# 	if Input.is_action_pressed("ui_down"):
# 		velocity.y += 10
# 	if Input.is_action_pressed("ui_up"):
# 		velocity.y -= 10
		
# #	if Input.action_release("ui_right"):
# #		velocity.x = 0
	
# 	velocity = velocity.normalized() * SPEED
# 	move_and_slide()
func GetInput():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input.normalized()

func PlayerMovement(delta):
	input = GetInput()

	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += input * acceleration * delta
		velocity = velocity.limit_length(max_speed)
	






#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
## Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#
#
#func _physics_process(delta):
#	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta
#
#	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY
#
#	# Get the input direction and handle the movement/deceleration.
#	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)
#
#	move_and_slide()
