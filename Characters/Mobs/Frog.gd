extends CharacterBody2D


@onready var animation = $AnimationPlayer

func _ready():
	animation.play("Idle")

func _physics_process(delta):
	if velocity.x > 10 or velocity.y > 10:
		animation.play("Jump")
	else:
		animation.play("Idle")

func TakeDamage(damage: int):
	print("Damage: ", damage)
