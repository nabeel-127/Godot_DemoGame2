extends CharacterBody2D


@onready var animation = $AnimationPlayer

func _ready():
	animation.play("Idle")

func TakeDamage(damage: int) -> void:
	animation.play("Jump")
	print("Damage: ", damage)
