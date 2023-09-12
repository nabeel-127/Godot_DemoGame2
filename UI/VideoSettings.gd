extends Control



@onready var Resolution = $LeftPanel/Resolution/ResolutionButton
@onready var MaxFPS = $LeftPanel/MaxFPS/HSlider
@onready var MaxFPSLabel2 = $LeftPanel/MaxFPS/MaxFPSLabel2

var IndexResolutionRange = {
	0: "640x480",
	1: "800x600",
	2: "1024x768",
	3: "1152x864",
	4: "1280x800",
	5: "1280x960",
	6: "1440x1080",
	7: "1920x1080",
	8: "2560x1440",
	9: "3840x2160"
}
var ResolutionIndexRange = {
	"640x480": 0,
	"800x600": 1,
	"1024x768": 2,
	"1152x864": 3,
	"1280x800": 4,
	"1280x960": 5,
	"1440x1080": 6,
	"1920x1080": 7,
	"2560x1440": 8,
	"3840x2160": 9
}
var SelectedResolution
var FPSRange = {
	0: 30,
	1: 60,
	2: 120,
	3: 144,
	4: 165,
	5: 240,
	6: 360
}



func _ready():
	ComputeResolution()
	AddResolutions()
	
	SetFPS()
	
	SelectResolution()
	
	print(DisplayServer.get_screen_count())
	print(DisplayServer.screen_get_size(0))
	print(DisplayServer.screen_get_size(1))
	print(DisplayServer.get_primary_screen())



func _process(_delta):
	pass



func AddResolutions():
#	Resolution.add_item("800x600")	
	var i = 0
	while (i < IndexResolutionRange.size()):
		Resolution.add_item(IndexResolutionRange[i])
		i += 1	

func RemoveResolutions():
	var i = IndexResolutionRange.size() - 1
	while i >= 0:
		Resolution.remove_item(i)
		i -= 1

func ComputeResolution():
	SelectedResolution = DisplayServer.window_get_size()
	SelectedResolution = str(SelectedResolution[0]) + "x" + str(SelectedResolution[1])

func SelectResolution():
	Resolution.select(ResolutionIndexRange[SelectedResolution])

func SetFPS():
	MaxFPSLabel2.text = str(FPSRange[int(MaxFPS.value)])
	Engine.max_fps = FPSRange[int(MaxFPS.value)]



func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://UI/Settings.tscn")


func _on_fullscreen_toggled(button_pressed):
	if button_pressed:
		DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_FULLSCREEN)
		RemoveResolutions()
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		AddResolutions()
		SelectResolution()


func _on_borderless_toggled(button_pressed):
	if button_pressed:
		DisplayServer.window_set_flag(DisplayServer.WindowFlags.WINDOW_FLAG_BORDERLESS, 1)
	else:
		DisplayServer.window_set_flag(DisplayServer.WindowFlags.WINDOW_FLAG_BORDERLESS, 0)


func _on_v_sync_toggled(button_pressed):
	if button_pressed:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
		MaxFPSLabel2.text = ""
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		SetFPS()


func _on_resolution_item_selected(index):
	var CurrentResolution = DisplayServer.window_get_size()
#	var CurrentPosition = DisplayServer.window_get_position()
	var resolution = Resolution.get_item_text(index)
	resolution = resolution.split('x')
	var NewResolution = Vector2i(int(resolution[0]), int(resolution[1]))
#	var NewPosition = Vector2i(NewX, NewY)
	SelectedResolution = str(NewResolution[0]) + "x" + str(NewResolution[1])
	DisplayServer.window_set_size(NewResolution)
#	DisplayServer.window_set_position(NewPosition)


func _on_h_slider_drag_ended(value_changed):
	if value_changed:
		SetFPS()


func _on_h_slider_value_changed(value):
	SetFPS()

