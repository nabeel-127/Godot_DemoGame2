class_name MyHitBox
extends Area2D



@export var damage: int = 10

func _init():
	collision_layer = 2
	collision_mask = 0

func _ready():
	collision_layer = 2
	collision_mask = 0
