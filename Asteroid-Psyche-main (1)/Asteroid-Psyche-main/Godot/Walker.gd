extends CharacterBody2D

@onready var player = $"/root/Asteroid Psyche/Billy"

const SPEED = 20.0
const JUMP_VELOCITY = -100.0
const GRAVITY = 400
var health = 3

# Get the gravity from the project settings to be synced with RigidBody nodes
var gravity = GRAVITY

func _physics_process(delta):
	# Add gravity if not on the floor
	if not is_on_floor():
		velocity.y += gravity * delta

	# Calculate the direction towards the player
	var direction = (player.global_position - global_position).normalized()

	# Restrict movement to the x-axis by setting y to zero
	direction.y = 0

	# Set horizontal velocity based on direction and speed
	velocity.x = SPEED * direction.x

	# Check for collision with a wall and jump if necessary
	if is_on_wall() and is_on_floor():
		# Apply jump velocity
		velocity.y = JUMP_VELOCITY

	# Move the character
	move_and_slide()


