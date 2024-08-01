extends RichTextLabel

var default_text = "Timer: "


func _ready():
	# Ensure the Timer node is correctly accessed
	var timer = $Timer
	if timer:
		timer.start() # Start the timer when the scene is ready
		timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	else:
		print("Error: Timer node not found!")

func _process(delta):
	if not Global.game_ended:
		var formatted_time = format_time(Global.elapsed_time)
		self.text = default_text + formatted_time
	if Global.game_ended:
		self.visible = false

func format_time(value: float) -> String:
	var minutes = int(value / 60)
	var seconds = int(value) % 60
	return str(minutes).pad_zeros(2) + ":" + str(seconds).pad_zeros(2)

func _on_timer_timeout():
	var timer = $Timer
	if timer:
		Global.elapsed_time += timer.wait_time
