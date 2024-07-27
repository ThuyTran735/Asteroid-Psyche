extends Node2D

@onready var particles = $CPUParticles2D

# Total time for the level in seconds
var total_time: int = 300  # Example: 5 minutes

func _ready() -> void:
	update_money()

func update_money():
	Global.money
