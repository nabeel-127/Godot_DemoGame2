extends Node2D

func _ready():
	$Sprite2D1.visible = false
	$Sprite2D1/MyHitBox.collision_layer = 0
	$Sprite2D1/MyHitBox.collision_mask = 0
	$Sprite2D2.visible = false
	$Sprite2D2/MyHitBox.collision_layer = 0
	$Sprite2D2/MyHitBox.collision_mask = 0
	$Sprite2D3.visible = false
	$Sprite2D3/MyHitBox.collision_layer = 0
	$Sprite2D3/MyHitBox.collision_mask = 0
	$Sprite2D4.visible = false
	$Sprite2D4/MyHitBox.collision_layer = 0
	$Sprite2D4/MyHitBox.collision_mask = 0
	
