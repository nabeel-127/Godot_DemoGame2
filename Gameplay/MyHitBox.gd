class_name MyHitBox
extends Area2D



var damage: int = 10
#var WeaponDamages = {
#	"1": 10,
#	"2": 10,
#	"3": 20,
#	"4": 50
#}

func _init():
	collision_layer = 2
	collision_mask = 0

func _ready():
	collision_layer = 2
	collision_mask = 0
#	var WeaponIndex = str(self.get_parent())
#	damage = WeaponDamages[WeaponIndex[8]]
#	print(damage)
