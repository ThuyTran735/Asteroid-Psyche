extends CharacterBody2D

const SPEED = 75
const JUMP_VELOCITY = -200
const max_range = 5000

var based_width = 3
var widthy = based_width
var shoot = false
var laser_offset = 5
@onready var LaserDrillMarker = $LaserDrillMarker
@onready var animated_sprite_2d = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$Control.z_index = 1
	$Control.mouse_filter = Control.MOUSE_FILTER_IGNORE

func _physics_process(delta):
	# Default to hidden laser
	$Laser.visible = false
	if Global.item_main == 6:
		$Laser.width = widthy

		# Determine laser offset based on character facing direction
		if animated_sprite_2d.flip_h:
			laser_offset = -7
		else:
			laser_offset = 7

		# Adjust laser position based on offset
		var laser_base_position = global_position + Vector2(laser_offset, -3.5)
		$Laser.global_position = laser_base_position

		# Get the mouse position
		var mouse_position = get_global_mouse_position()

		# Calculate the laser direction and distance
		var laser_direction = (mouse_position - laser_base_position).normalized()
		var laser_distance = min((mouse_position - laser_base_position).length(), max_range)

		# Set the laser end point
		var laser_end_position = laser_base_position + laser_direction * laser_distance

		# Update laser points
		$Laser.set_point_position(0, $Laser.to_local(laser_base_position))
		$Laser.set_point_position(1, $Laser.to_local(laser_end_position))

		# Debug print statements
		if Input.is_action_just_pressed("mb_left"):
			shoot = true
		else:
			shoot = false

		if shoot:
			$Laser.visible = true
		else:
			$Laser.visible = false

	# Handle jumping and movement
	if not is_on_floor():
		velocity.y += gravity * delta

	var mouse_pos = get_global_mouse_position()
	var player_pos = global_position

	if Input.is_action_just_pressed("jump") and is_on_floor():
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

func player_sell_method():
	pass

func player_shop_method():
	pass
