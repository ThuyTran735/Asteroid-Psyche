extends Node2D

# Total time for the level in seconds
var total_time: int = 300  # Example: 5 minutes

# Called when the node enters the scene tree for the first time
func _ready():
	# Connect the timer's timeout signal to the function
	$"Air Left".connect("timeout", _on_air_left_timeout)
	# Start the timer
	$"Air Left".start()

# Function called when the timer times out
func _on_air_left_timeout():
	# Decrease the total time by 1 second
	total_time -= 1

	# Format time as MM:SS
	var minutes: int = total_time / 60
	var seconds: int = total_time % 60
	$"Air Left Display".text = str(minutes).pad_zeros(2) + ":" + str(seconds).pad_zeros(2)

	# Check if the time has run out
	if total_time <= 0:
		game_over()

# Function to handle game over state
func game_over():
	# Stop the timer
	$"Air Left Display".stop()
	# Implement game over logic, such as showing a game over screen
	print("Time's up! Game Over!")


