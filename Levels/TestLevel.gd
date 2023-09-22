extends Node2D


var SavePath = "user://save/"
var SaveName = "PlayerSave.tres"
var Player1Data = PlayerData.new()

func _ready():
	VerifySaveDirectory(SavePath)

func VerifySaveDirectory(path):
	DirAccess.make_dir_absolute(path)

func _on_change_health_button_pressed():
	Player1Data.ChangeHealth(-5)
	print("ChangeHealth: " + str(Player1Data.health))

func _on_save_button_pressed():
	ResourceSaver.save(Player1Data, SavePath + SaveName)
	print("save: " + str(Player1Data.health))

func _on_load_button_pressed():
	Player1Data = ResourceLoader.load(SavePath + SaveName).duplicate(true)
	print("load: " + str(Player1Data.health))

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Main.tscn")
	print("ChangeHealth: " + str(Player1Data.health))

