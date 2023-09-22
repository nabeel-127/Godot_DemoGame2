class_name MyHitBox
extends Area2D



func _init():
	collision_layer = 2
	collision_mask = 0

func _ready():
	collision_layer = 2
	collision_mask = 0


func GetDamage():
	if owner.has_method("GetDamage"):
		return owner.GetDamage()
