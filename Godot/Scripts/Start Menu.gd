extends Control

func _on_play_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/asteroid_psyche.tscn")


func _on_options_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")


func _on_quit_game_pressed():
	get_tree().quit()
