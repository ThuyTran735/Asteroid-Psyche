extends RichTextLabel

var default_text = "Amount Mined: "

func _process(delta):
	var formatted_money = format_number(Global.emerald_ore_amount)
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
