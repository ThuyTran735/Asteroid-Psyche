extends Control

func _on_volume_value_changed(value):
	Global.volume = value
	AudioServer.set_bus_volume_db(0, value)
	$AudioStreamPlayer2D.play()

func _on_mute_toggled(toggled_on):
	AudioServer.set_bus_mute(0, toggled_on)

func _on_resolutions_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920, 1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600, 900))
		2:
			DisplayServer.window_set_size(Vector2i(1280, 720))

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/start_menu.tscn")
