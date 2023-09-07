extends Control



@onready var Resolution = $LeftPanel/Resolution/ResolutionButton



func _ready():
	AddResolutions()
	print(DisplayServer.get_screen_count())
	print(DisplayServer.screen_get_size(0))
	print(DisplayServer.screen_get_size(1))
	print(DisplayServer.get_primary_screen())
#	print(DisplayServer.)
#	print(DisplayServer.)

func _process(delta):
	pass



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
	Resolution.add_item("2880x1800")

func RemoveResolutions():
	var i = 8
	while i >= 0:
		Resolution.remove_item(i)
		i -= 1



func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://UI/Settings.tscn")



func _on_fullscreen_toggled(button_pressed):
	if button_pressed:
		DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_FULLSCREEN)
		RemoveResolutions()
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		AddResolutions()



func _on_borderless_toggled(button_pressed):
	if button_pressed:
		DisplayServer.window_set_flag(DisplayServer.WindowFlags.WINDOW_FLAG_BORDERLESS, 1)
	else:
		DisplayServer.window_set_flag(DisplayServer.WindowFlags.WINDOW_FLAG_BORDERLESS, 0)



func _on_resolution_item_selected(index):
	var CurrentResolution = DisplayServer.window_get_size()
	var CurrentPosition = DisplayServer.window_get_position()
	
	var resolution = Resolution.get_item_text(index)
	resolution = resolution.split('x')
#	var width = int(resolution[0])
#	var height = int(resolution[1])
	
	var NewResolution = Vector2i(int(resolution[0]), int(resolution[1]))
	
	print(CurrentPosition)
#	var NewPosition = Vector2i(NewX, NewY)
	DisplayServer.window_set_size(NewResolution)
#	DisplayServer.window_set_position(NewPosition)



func _on_v_sync_toggled(button_pressed):
	if button_pressed:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
