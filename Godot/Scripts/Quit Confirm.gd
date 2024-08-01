extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	$"../MarginContainer2".visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_quit_pressed():
	Global.quit_button = 1
	$"../Main UI".visible = false
	$"../MarginContainer".visible = false
	self.visible = true
	$"../MarginContainer2".visible = true


func _on_yes_pressed():
	get_tree().quit()

func _on_cancel_pressed():
	Global.quit_button = 0
	$"../Main UI".visible = true
	$"../MarginContainer".visible = true
	self.visible = false
	$"../MarginContainer2".visible = false
