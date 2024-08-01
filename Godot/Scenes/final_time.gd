extends RichTextLabel


func _process(delta):
	var elapsed = Global.elapsed_time
	var minutes = int(elapsed / 60)
	var seconds = int(elapsed) % 60
	if not Global.game_ended:
		var final = str(minutes).pad_zeros(2) + ":" + str(seconds).pad_zeros(2)
	# Use the current instance of RichTextLabel directly
		text = "You have completed \nAsteroid Psyche! \nCongrats, your time \nwas: " + str(final)
