extends Node2D

# Total time for the level in seconds
var total_time: int = 300  # Example: 5 minutes

func _ready() -> void:
	update_money()

func update_money():
	Global.money

func breaking():
	var audio_player = $block
	
	# Preload audio streams
	var audio_streams = [
		preload("res://Assets/Audio/blocks/break/gravel1.ogg"),
		preload("res://Assets/Audio/blocks/break/gravel2.ogg"),
		preload("res://Assets/Audio/blocks/break/gravel3.ogg"),
		preload("res://Assets/Audio/blocks/break/gravel4.ogg")
	]
	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	# Generate a random index from 0 to 3
	var blockSound = rng.randi_range(0, audio_streams.size() - 1)
	
	# Set the audio stream and play it
	audio_player.stream = audio_streams[blockSound]
	audio_player.play()
	
func place():
	var audio_player = $block
	
	# Preload audio streams
	var audio_streams = [
		preload("res://Assets/Audio/blocks/place/stone1.ogg"),
		preload("res://Assets/Audio/blocks/place/stone2.ogg"),
		preload("res://Assets/Audio/blocks/place/stone3.ogg"),
		preload("res://Assets/Audio/blocks/place/stone4.ogg")
	]
	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	# Generate a random index from 0 to 3
	var blockSound = rng.randi_range(0, audio_streams.size() - 1)
	
	# Set the audio stream and play it
	audio_player.stream = audio_streams[blockSound]
	audio_player.play()
