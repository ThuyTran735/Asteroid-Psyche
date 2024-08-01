extends Control

func _ready():
	load_settings()

func _on_volume_value_changed(value):
	Global.volume = value / 2
	Global.volume = Global.volume / 2
	AudioServer.set_bus_volume_db(0, value)
	$AudioStreamPlayer2D.play()
	save_settings()  # Save settings after changing volume

func _on_mute_toggled(toggled_on):
	AudioServer.set_bus_mute(0, toggled_on)
	save_settings()  # Save settings after toggling mute

func _on_resolutions_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920, 1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600, 900))
		2:
			DisplayServer.window_set_size(Vector2i(1280, 720))
	save_settings()  # Save settings after changing resolution

func _on_back_button_pressed():
	if Global.previous_scene == 0:
		get_tree().change_scene_to_file("res://Scenes/start_menu.tscn")
	elif Global.previous_scene == 1:
		get_tree().change_scene_to_file("res://Scenes/asteroid_psyche.tscn")

func save_settings():
	var config = ConfigFile.new()
	config.set_value("audio", "volume", Global.volume)
	config.set_value("audio", "mute", AudioServer.is_bus_mute(0))
	config.set_value("graphics", "resolution_index", $MarginContainer/VBoxContainer/Resolutions.selected)
	config.save("user://settings.cfg")

func load_settings():
	var config = ConfigFile.new()
	if config.load("user://settings.cfg") == OK:
		Global.volume = config.get_value("audio", "volume", 0.0)
		AudioServer.set_bus_volume_db(0, Global.volume)
		$MarginContainer/VBoxContainer/Volume.value = Global.volume  # Set the volume slider value

		var mute = config.get_value("audio", "mute", false)
		AudioServer.set_bus_mute(0, mute)
		$MarginContainer/VBoxContainer/Mute.set_pressed(mute)  # Set the mute checkbox state

		var resolution_index = config.get_value("graphics", "resolution_index", 0)
		$MarginContainer/VBoxContainer/Resolutions.select(resolution_index)
		_on_resolutions_item_selected(resolution_index)
