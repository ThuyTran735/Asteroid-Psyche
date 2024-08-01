extends ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_credits_pressed():
	Global.quit_button = 1
	$"../Main UI".visible = false
	$"../MarginContainer".visible = false
	self.visible = true

func _on_back_2_pressed():
	Global.quit_button = 0
	$"../Main UI".visible = true
	$"../MarginContainer".visible = true
	self.visible = false
