extends Control


func _ready():
	Engine.max_fps = 360



func _on_quit_pressed():
	get_tree().quit()

func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://UI/Settings.tscn")

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Levels/TestLevel.tscn")
