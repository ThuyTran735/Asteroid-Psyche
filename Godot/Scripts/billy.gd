extends CharacterBody2D

const SPEED = 75
const JUMP_VELOCITY = -200
const max_range = 5000

var based_width = 3
var widthy = based_width
var shoot = false 
var laser_offset = 5
@onready var collision = $Laser/DamageAreaLaserDrill/CollisionShape2D
@onready var LaserDrillMarker = $LaserDrillMarker

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	$Control.z_index = 1
	$Control.mouse_filter = Control.MOUSE_FILTER_IGNORE
	
	
func _physics_process(delta):
	$Laser.visible = false
	if Global.item_main == 6:
		$Laser.width = widthy
		
		# Determine laser offset based on character facing direction
		if animated_sprite_2d.flip_h:
			laser_offset = -5
		else:
			laser_offset = 5
			
		# Adjust laser position based on offset
		$Laser.global_position = global_position + Vector2(laser_offset, -3.5)
		
		var mouse_position = get_local_mouse_position()
		var max_cast_to = mouse_position.normalized() * max_range
		$RayCast2D.target_position = max_cast_to
		
		if $RayCast2D.is_colliding():
			$LaserDrillMarker.global_position = $RayCast2D.get_collision_point()
			$Laser.set_point_position(1, $Laser.to_local($LaserDrillMarker.global_position))
		else:
			$LaserDrillMarker.global_position = $RayCast2D.target_position
			$Laser.points[1] = $LaserDrillMarker.global_position
			$Laser/DamageAreaLaserDrill/CollisionShape2D
			
		if shoot == true:
			collision.shape.b = $Laser.points[1]
			collision.disabled = false
			$Laser.visible = true
		else:
			collision.shape.b = Vector2.ZERO
			collision.disabled = true
			$Laser.visible = false
			
		if Input.is_action_pressed("mb_left"):
			shoot = true
		else: 
			shoot = false
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Get the global mouse position
	var mouse_pos = get_global_mouse_position()
	# Get the global position of the player
	var player_pos = global_position

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Gets the input direction: -1 (Left), 0 (Nothing), 1 (Right)
	var direction = Input.get_axis("move_left", "move_right")
	
	# Determine if the mouse is to the left or right of the player
	if mouse_pos.x < player_pos.x:
		animated_sprite_2d.flip_h = true
		
	else:
		animated_sprite_2d.flip_h = false
	
	# Flip sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	# Play animations
	if direction == 0: 
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

	# Movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	# If left mouse button is pressed, play mining animation
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
				animated_sprite_2d.play("")
				
	move_and_slide()
	
func player_sell_method(): 
	pass

func player_shop_method(): 
	pass
	
