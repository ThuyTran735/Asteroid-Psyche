extends Control

@onready var target_control = $"." 
@onready var button = $"../Settings"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	
func _process(delta):
	if Global.game_ended:
		$MarginContainer.visible = false
	if target_control.visible == true:
		button.visible = false
	if Global.back_button == 0:
		if Global.quit_button == 0:
			button.visible = true
			target_control.visible = false

# Method to handle button press
func _on_settings_pressed():
	# Toggle the visibility of the target Control node
	target_control.visible = not target_control.visible
	Global.back_button = 1
	get_tree().paused = true
	
