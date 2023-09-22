extends CharacterBody2D


@onready var animation = $AnimationPlayer
var health: float = 100

func _ready():
	animation.play("Idle")

func _physics_process(delta):
	if velocity.x > 10 or velocity.y > 10:
		animation.play("Jump")
	else:
		animation.play("Idle")

func TakeDamage(damage : float):
	health -= damage
	print("FrogDamageTaken: ", damage)
	print("FrogHealth: ", health)
