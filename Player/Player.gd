extends CharacterBody2D

const max_speed = 100
const acceleration = 500
const friction = 1000
var health = 100
var input = Vector2.ZERO
@onready var animation = get_node("AnimationPlayer")

func _ready():
#	get_node("AnimatedSprite2D").play("Idle")
#	animation.play("Idle")
	velocity.y = 0.1
	PlayAnimation()

func _physics_process(delta):
	PlayerMovement(delta)
	PlayAnimation()
	move_and_slide()

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

func PlayAnimation():
#	if velocity.x < 10 and velocity.x > -10:
#		animation.play("Idle")
#	elif velocity.x > 10:
#		get_node("AnimatedSprite2D").flip_h = false		
#		animation.play("Run")
#	elif velocity.x < -10:
#		get_node("AnimatedSprite2D").flip_h = true
#		animation.play("Run")
	velocity.normalized()
	if velocity == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("Idle")
	else:
		$AnimationTree.get("parameters/playback").travel("Walk")
		$AnimationTree.set("parameters/Walk/blend_position", velocity)
		$AnimationTree.set("parameters/Idle/blend_position", velocity)

func TakeDamage(damage):
	health -= damage

func GetHealth():
	return health
