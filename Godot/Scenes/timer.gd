extends RichTextLabel

var default_text = "Time: "
var elapsed_time: float = 0.0

func _ready():
	# Ensure the Timer node is correctly accessed
	var timer = $Timer
	if timer:
		timer.start() # Start the timer when the scene is ready
	else:
		print("Error: Timer node not found!")

func _process(delta):
	var text_to_display = default_text + str(elapsed_time)
	self.text = text_to_display

func _on_Timer_timeout():
	elapsed_time += $Timer.wait_time
	print("Elapsed Time: ", elapsed_time)
