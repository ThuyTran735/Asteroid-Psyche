extends ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	# Ensure the panel is blocking mouse clicks
	self.mouse_filter = Control.MOUSE_FILTER_STOP
	
	# Hide the Exit Button
	$"..".visible = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Convert integer to boolean for checking
	if Global.back_button != 0:
		$"..".visible = true
	if Global.game_ended:
		self.visible = false
		
func _on_back_pressed():
	get_tree().paused = false
	# Set the integer value to 0 (false)
	Global.back_button = 0


func _on_options_pressed():
	Global.previous_scene = 1
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")
