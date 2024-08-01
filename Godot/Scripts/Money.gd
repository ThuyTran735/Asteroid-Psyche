extends RichTextLabel

var default_text = "Money: $"

func _process(delta):
	if Global.game_ended == true:
		$"..".visible = false
	if Global.reset == 1:
		$"../Settings".visible = true 
		$"../Time".visible = true
		$"../Money".visible = true
		$"../BlockAmount".visible = true
		get_tree().paused = false
		get_tree().change_scene_to_file("res://Scenes/asteroid_psyche.tscn")
		Global.reset_state()
	var formatted_money = format_number(Global.money)
	var text = default_text + formatted_money
	self.text = text

func format_number(value):
	var str_value = str(value)
	var parts = str_value.split(".")
	var int_part = parts[0]
	var frac_part = "." + parts[1] if parts.size() > 1 else ""
	var result = ""
	var count = 0

	for i in range(int_part.length() - 1, -1, -1):
		result = int_part[i] + result
		count += 1
		if count % 3 == 0 and i != 0:
			result = "," + result

	return result + frac_part
