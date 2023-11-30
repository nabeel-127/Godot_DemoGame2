extends CharacterBody2D



const max_speed = 100
const acceleration = 500
const friction = 1000

var health: float = 1000
var input = Vector2.ZERO
var IsAttacking: bool = false
var Weapon: int = 2
@onready var MyAnimationPlayer = $AnimationPlayer
@onready var MyAnimationTree = $AnimationTree
@onready var MagicArrow = [get_node("MagicArrow")]					#[0]

func _ready():
	velocity.y = 0.1
	PlayAnimation()
	
	MyAnimationTree.animation_started.connect(GetAnimation)
	
	if MagicArrow[0] != null:
		MagicArrow.append(MagicArrow[0].get_node("AnimationPlayer"))
		MagicArrow.append(MagicArrow[0].get_node("Sprite2D"))
		MagicArrow.append(MagicArrow[2].get_node("MyHitBox"))
	




func _physics_process(delta):
	PlayerMovement(delta)
	PlayAnimation()
	move_and_slide()
	
	if not IsAttacking:
		SelectWeapon()
	
	if Input.is_action_just_pressed("ui_accept"):
		Show(MagicArrow)
		MagicArrow[1].play("MagicArrow")
		MagicArrow[0].position = Vector2(-5, 20)
		MagicArrow[0].rotation = deg_to_rad(0)
		MagicArrow[2].flip_h = true
		MagicArrow[2].flip_v = true
		
	
	if not MagicArrow[1].is_playing() and IsAttacking == true:
		Hide(MagicArrow)
	

func GetAnimation(animation_name: String):
	print(animation_name)

func SelectWeapon():
	if Input.is_action_just_pressed("Weapon1"):
		Weapon = 1
	elif Input.is_action_just_pressed("Weapon2"):
		Weapon = 2
	elif Input.is_action_just_pressed("Weapon3"):
		Weapon = 3
	elif Input.is_action_just_pressed("Weapon4"):
		Weapon = 4

func Hide(HideObject):
	if HideObject[0] != null:
		HideObject[2].visible = false
		HideObject[3].collision_layer = 0
		HideObject[3].collision_mask = 0
		IsAttacking = false

func Show(ShowObject):
	if ShowObject[0] != null:
		ShowObject[2].visible = true
		ShowObject[3].collision_layer = 2
		ShowObject[3].collision_mask = 0
		IsAttacking = true


func GetInput():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
#	if input != Vector2.ZERO:
#		print(input)
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
	velocity.normalized()
	if velocity == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("Idle")
	else:
		$AnimationTree.get("parameters/playback").travel("Walk")
		$AnimationTree.set("parameters/Walk/blend_position", velocity)
		$AnimationTree.set("parameters/Idle/blend_position", velocity)


func TakeDamage(damage : float):
	health -= damage
	print("PlayerDamageTaken: ", damage)
	print("PlayerHealth: ", health)

func GetHealth():
	return health
