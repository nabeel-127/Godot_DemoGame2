extends Control



@onready var Resolution = $LeftPanel/HBoxContainer2/Resolution



func _ready():
	AddResolutions()



func AddResolutions():
	Resolution.remove_item(0)
	Resolution.add_item("640x480")
	Resolution.add_item("800x600")
	Resolution.add_item("1024x768")
	Resolution.add_item("1152x864")
	Resolution.add_item("1280x800")
	Resolution.add_item("1280x960")
	Resolution.add_item("1440x1080")
	Resolution.add_item("1920x1080")
	Resolution.add_item("1920x1200")



func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://UI/Settings.tscn")



func _on_fullscreen_toggled(button_pressed):
	if button_pressed:
		DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
