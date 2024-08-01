extends CharacterBody2D

const SPEED = 75
const JUMP_VELOCITY = -200
const max_range = 5000
const LASER_DURATION = 0.15  # Set the laser duration in seconds, change it in LaserTimer node too

var based_width = 3
var widthy = based_width
var laser_offset = 5
var laser_start_position: Vector2
var laser_end_position: Vector2
@onready var LaserDrillMarker = $LaserDrillMarker
@onready var animated_sprite_2d = $AnimatedSprite2D

@export var laser_timer: Timer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	# Initialize the timer variable if not set in the editor
	if laser_timer == null:
		laser_timer = $LaserTimer
	laser_timer.timeout.connect(_on_laser_timer_timeout)
	# Set the timer's wait time to x amount of seconds
	laser_timer.wait_time = LASER_DURATION
	laser_timer.one_shot = true
	# Ensure the laser starts as invisible
	$Laser.visible = false
	
	$Control.z_index = 1
	$Control.mouse_filter = Control.MOUSE_FILTER_IGNORE

func _physics_process(delta):
	Global.end_game()
	if Global.game_ended:
		show_game_over_screen()
		$"../Billy/Control/Information".visible = false 
		$"../Billy/Control/timer".visible = false 
		$"../Billy/Control/Money".visible = false
		$"../Billy/Control/BlockAmount".visible = false
	_on_button_2_pressed	
	_on_button_pressed
	
	
	if Input.is_action_just_pressed("add_money"):
		Global.money = 999999
	if $"../Billy/Control/Information".visible == false:
		if Global.item_main == 6:
			$Laser.width = widthy

			# Determine laser offset based on character facing direction
			if animated_sprite_2d.flip_h:
				laser_offset = -7
			else:
				laser_offset = 7

			if $Laser.visible:
				# Laser is visible, do not update its position
				# Keep the laser in place based on its stored start and end positions
				$Laser.set_point_position(0, $Laser.to_local(laser_start_position))
				$Laser.set_point_position(1, $Laser.to_local(laser_end_position))
			else:
				# Calculate and update the laser's position when it is not visible
				var laser_base_position = global_position + Vector2(laser_offset, -3.5)
				$Laser.global_position = laser_base_position

				# Get the mouse position
				var mouse_position = get_global_mouse_position()

				# Calculate the laser direction and distance
				var laser_direction = (mouse_position - laser_base_position).normalized()
				var laser_distance = min((mouse_position - laser_base_position).length(), max_range)

				# Set the laser end point
				laser_end_position = laser_base_position + laser_direction * laser_distance

				# Update laser points
				$Laser.set_point_position(0, $Laser.to_local(laser_base_position))
				$Laser.set_point_position(1, $Laser.to_local(laser_end_position))

			if Input.is_action_just_pressed("mb_left"):
				# Calculate and store laser positions
				laser_start_position = global_position + Vector2(laser_offset, -3.5)
				var mouse_position = get_global_mouse_position()
				var laser_direction = (mouse_position - laser_start_position).normalized()
				var laser_distance = min((mouse_position - laser_start_position).length(), max_range)
				laser_end_position = laser_start_position + laser_direction * laser_distance

				# Set the laser visible when the button is pressed
				$Laser.visible = true
				# Start the timer
				laser_timer.start()

	# Handle jumping and movement
	if not is_on_floor():
		velocity.y += gravity * delta

	var mouse_pos = get_global_mouse_position()
	var player_pos = global_position

	if Input.is_action_just_pressed("jump") and is_on_floor():
		var audio_player = $jump
		var audio_stream1 = load("res://Assets/Audio/jump.mp3")
		audio_player.stream = audio_stream1
		audio_player.play()
		velocity.y = JUMP_VELOCITY



	var move_direction = Input.get_axis("move_left", "move_right")
	if mouse_pos.x < player_pos.x:
		animated_sprite_2d.flip_h = true
	else:
		animated_sprite_2d.flip_h = false

	if move_direction > 0:
		animated_sprite_2d.flip_h = false
	elif move_direction < 0:
		animated_sprite_2d.flip_h = true

	if move_direction == 0:
		match Global.item_main:
			0:
				animated_sprite_2d.play("idle")
			1:
				animated_sprite_2d.play("idle_basic_shovel")
			2:
				animated_sprite_2d.play("idle_basic_pickaxe")
			3:
				animated_sprite_2d.play("idle_small_drill")
			4:
				animated_sprite_2d.play("idle_medium_drill")
			5:
				animated_sprite_2d.play("idle_large_drill")
			6:
				animated_sprite_2d.play("idle_laser_drill")
	else:
		match Global.item_main:
			0:
				animated_sprite_2d.play("walk")
			1:
				animated_sprite_2d.play("walk_basic_shovel")
			2:
				animated_sprite_2d.play("walk_basic_pickaxe")
			3:
				animated_sprite_2d.play("walk_small_drill")
			4:
				animated_sprite_2d.play("walk_medium_drill")
			5:
				animated_sprite_2d.play("walk_large_drill")
			6:
				animated_sprite_2d.play("walk_laser_drill")

	if move_direction:
		velocity.x = move_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_pressed("mb_left"):
		match Global.item_main:
			0:
				animated_sprite_2d.play("mine")
			1:
				animated_sprite_2d.play("mine_basic_shovel")
			2:
				animated_sprite_2d.play("mine_basic_pickaxe")
			3:
				animated_sprite_2d.play("mine_small_drill")
			4:
				animated_sprite_2d.play("mine_medium_drill")
			5:
				animated_sprite_2d.play("mine_large_drill")
			6:
				animated_sprite_2d.play("mine_laser_drill")

	move_and_slide()
	if $IwonderWhatThisDoes.playing == false:
		$IwonderWhatThisDoes.play()
		
func _on_laser_timer_timeout():
	# Hide the laser when the timer times out
	$Laser.visible = false

func player_sell_method():
	# Placeholder for player sell logic
	pass

func player_shop_method():
	# Placeholder for player shop logic
	pass

func show_game_over_screen():
	var game_over_screen = $GameOverScreen  # Replace with the actual path to your Game Over screen node
	game_over_screen.visible = true  # Make the Game Over screen visible

func _on_button_pressed():
	get_tree().quit()


func _on_button_2_pressed():
	var game_over_screen = $GameOverScreen  # Replace with the actual path to your Game Over screen node
	game_over_screen.visible = false
	$"../Billy/Control/Information".visible = true 
	$"../Billy/Control/timer".visible = true 
	$"../Billy/Control/Money".visible = true
	$"../Billy/Control/BlockAmount".visible = true
	Global.reset_state()
	get_tree().reload_current_scene()
	
