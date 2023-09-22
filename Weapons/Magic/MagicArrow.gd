extends Node2D

func _ready():
	$Sprite2D.visible = false
	$Sprite2D/MyHitBox.collision_layer = 0
	$Sprite2D/MyHitBox.collision_mask = 0
