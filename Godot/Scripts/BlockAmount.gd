extends RichTextLabel

var default_text = "Blocks: "

func _process(delta):
	var formatted_money = format_number(Global.blocks)
	var text = default_text + formatted_money
	self.text = text

func format_number(value):
	var str_value = str(value)
	var result = ""
	var count = 0

	for i in range(str_value.length() - 1, -1, -1):
		result = str_value[i] + result
		count += 1
		if count % 3 == 0 and i != 0:
			result = "," + result

	return result
