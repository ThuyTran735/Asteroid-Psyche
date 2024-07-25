extends RichTextLabel

var default_text = "Money: $"
func _process(delta):
	var text = str(default_text, str(Global.current_money))
	self.text = (text)
