extends CPUParticles2D

@onready var particle_timer = $"../Particle Timer"

# Called when the node enters the scene tree for the first time.
func _ready():
	# You can adjust initial properties of the particles here if needed
	set_emitting(false)

# Handle input events
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		emit_particles_at_mouse()
		particle_timer.start()

# Function to emit particles at the mouse position
func emit_particles_at_mouse():
	# Get the global mouse position
	var mouse_position = get_global_mouse_position()
	# Set the position of the particles to the mouse position
	global_position = mouse_position
	# Emit the particles
	set_emitting(true)

	# Optionally, stop emitting after some time
	#await(get_tree().create_timer(0.1), "timeout")
	#set_emitting(false)

func _on_particle_timer_timeout():
	set_emitting(false)
