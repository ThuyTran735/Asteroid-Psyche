extends Control

@onready var target_control = $"." 
@onready var button = $"../Information"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	
func _process(delta):
	if target_control.visible == true:
		button.visible = false
	if Global.information_menu_exit_button == 0:
		button.visible = true
		target_control.visible = false
	if Global.information_menu_exit_button == 1:
		button.visible = false
		target_control.visible = false

# Method to handle button press
func _on_information_pressed():
	# Toggle the visibility of the target Control node
	target_control.visible = not target_control.visible
	Global.information_menu_exit_button = 1
	
