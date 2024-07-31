extends CanvasLayer

func _ready():
	self.visible = false
	var panel = $Panel
	
	# Set the panel to block mouse clicks
	panel.mouse_filter = Control.MOUSE_FILTER_STOP
