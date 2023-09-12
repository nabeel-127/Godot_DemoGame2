extends CharacterBody2D



const max_speed = 100
const acceleration = 500
const friction = 1000

var health: float = 100
var input = Vector2.ZERO
var IsSlashAttacking: bool = false
var Weapon: int = 2
@onready var MyAnimationPlayer = $AnimationPlayer
@onready var MyAnimationTree = $AnimationTree
@onready var SlashAttack = [get_node("SlashAttack")]					#[0]


func _ready():
	velocity.y = 0.1
	PlayAnimation()
	
	MyAnimationTree.animation_started.connect(GetAnimation)
	
	SlashAttack.append(SlashAttack[0].get_node("AnimationPlayer"))		#[1]
	SlashAttack.append(SlashAttack[0].get_node("Sprite2D1"))			#[2]
	SlashAttack.append(SlashAttack[2].get_node("MyHitBox"))				#[3]
	SlashAttack.append(SlashAttack[0].get_node("Sprite2D2"))			#[4]
	SlashAttack.append(SlashAttack[2].get_node("MyHitBox"))				#[5]
	SlashAttack.append(SlashAttack[0].get_node("Sprite2D3"))			#[6]
	SlashAttack.append(SlashAttack[2].get_node("MyHitBox"))				#[7]
	SlashAttack.append(SlashAttack[0].get_node("Sprite2D4"))			#[8]
	SlashAttack.append(SlashAttack[2].get_node("MyHitBox"))				#[9]



func _physics_process(delta):
	PlayerMovement(delta)
	PlayAnimation()
	move_and_slide()
	
	if not IsSlashAttacking:
		SelectWeapon()
	
	if Input.is_action_just_pressed("ui_accept"):
		SlashAttack[0].position = Vector2(0, -20)
		Show(SlashAttack, Weapon)
		SlashAttack[1].play("SlashAttack" + str(Weapon / 2))
#			SlashAttack[Weapon].flip_h = true
		
	
	if not SlashAttack[1].is_playing() and IsSlashAttacking == true:
		Hide(SlashAttack, Weapon)
	

func GetAnimation(animation_name: String):
	print(animation_name)

func SelectWeapon():
	if Input.is_action_just_pressed("Weapon1"):
		Weapon = 2
	elif Input.is_action_just_pressed("Weapon2"):
		Weapon = 4
	elif Input.is_action_just_pressed("Weapon3"):
		Weapon = 6
	elif Input.is_action_just_pressed("Weapon4"):
		Weapon = 8

func Hide(HideObject, index):
	if HideObject[0] != null:
		print("Entered Hide")		
		HideObject[index].visible = false
		HideObject[index + 1].collision_layer = 0
		HideObject[index + 1].collision_mask = 0
		IsSlashAttacking = false

func Show(ShowObject, index):
	if ShowObject[0] != null:
		print("Entered Show")		
		ShowObject[index].visible = true
		ShowObject[index + 1].collision_layer = 2
		ShowObject[index + 1].collision_mask = 0
		IsSlashAttacking = true


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
