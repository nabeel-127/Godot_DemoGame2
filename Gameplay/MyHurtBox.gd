class_name MyHurtBox
extends Area2D


func _init():
	collision_layer = 0
	collision_mask = 2

func _ready():
	area_entered.connect(_on_area_entered)
	collision_layer = 0
	collision_mask = 2

func _on_area_entered(hitbox: MyHitBox):
	if hitbox == null:
		return
	if owner.has_method("TakeDamage"):
		owner.TakeDamage(hitbox.damage)
		print(hitbox.damage)
