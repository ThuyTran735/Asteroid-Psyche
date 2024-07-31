extends ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	# Ensure the panel is blocking mouse clicks
	self.mouse_filter = Control.MOUSE_FILTER_STOP
	
	# Hide the Exit Button
	$"../Exit Button".visible = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Convert integer to boolean for checking
	if Global.information_menu_exit_button != 0:
		$"../Exit Button".visible = true

func _on_exit_button_pressed():
	# Set the integer value to 0 (false)
	Global.information_menu_exit_button = 0
