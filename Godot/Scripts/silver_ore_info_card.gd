extends StaticBody2D

var exit_button_pressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false

func _process(delta):
	if Global.silver_ore_amount >= 1 and not exit_button_pressed:
		if not self.visible:
			self.visible = true
	else:
		if self.visible:
			self.visible = false

func _on_exit_pressed():
	exit_button_pressed = true
	self.visible = false

# Function to reset exit button state and show the node
func show_node():
	exit_button_pressed = false
	self.visible = true
