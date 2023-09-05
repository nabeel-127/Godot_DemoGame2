extends Control



func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Main.tscn")



func _on_video_button_pressed():
	get_tree().change_scene_to_file("res://UI/VideoSettings.tscn")
