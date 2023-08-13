extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://UI/Settings.tscn")


func _on_check_button_toggled(button_pressed):
	if button_pressed:
		print(button_pressed)		
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN, 3)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED, 0)
