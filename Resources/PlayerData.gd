extends Resource
class_name PlayerData


@export var health: float = 100

func ChangeHealth(value : float):
	health += value
