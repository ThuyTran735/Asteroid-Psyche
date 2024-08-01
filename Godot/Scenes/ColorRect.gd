extends ColorRect

func _ready():
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	$"..".visible = false


func show_game_over_screen():
	var game_over_screen = $".."  # Replace with the actual path to your Game Over screen node
	game_over_screen.visible = true  # Make the Game Over screen visible

func _on_button_pressed():
	get_tree().quit()


func _on_button_2_pressed():
	$"..".visible = false
	Global.reset = 1
	Global.reset_state()
	get_tree().reload_current_scene()
	if Global.reset == 1:
		$"..".visible = false


func _process(delta):	
	Global.end_game()
	if Global.game_ended:
		show_game_over_screen()
		Global.back_button = 1
		get_tree().paused = true
		#$"../Control/Time".visible = false
		#$"../Billy/Control/Money".visible = false
		#$"../Billy/Control/BlockAmount".visible = false
	_on_button_2_pressed	
	_on_button_pressed
	
