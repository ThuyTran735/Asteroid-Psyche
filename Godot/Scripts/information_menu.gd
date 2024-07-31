extends Control

# Reference to the Control node you want to toggle visibility for
@onready var target_control = $"."  # Adjust path as needed

# Called when the node enters the scene tree for the first time.
func _ready():
	# Setup or initialize connections if needed
	# Note: Signal connections should be handled through the editor or setup here if required
	pass

# Method to handle button press
func _on_information_pressed():
	# Toggle the visibility of the target Control node
	target_control.visible = not target_control.visible
