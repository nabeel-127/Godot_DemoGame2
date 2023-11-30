extends Node2D

var damage: float = 30

func _ready():
	$Sprite2D.visible = false
	$Sprite2D/MyHitBox.collision_layer = 0
	$Sprite2D/MyHitBox.collision_mask = 0

func GetDamage():
	return damage
