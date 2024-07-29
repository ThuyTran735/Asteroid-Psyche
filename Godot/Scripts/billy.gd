extends CharacterBody2D


const SPEED = 50
const JUMP_VELOCITY = -200

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite_2d = $AnimatedSprite2D

#inventory stuff
@export var inv: Inv 

func _physics_process(delta):
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
		if Global.item_main == 1:
			animated_sprite_2d.play("idle_basic_shovel")
		else:
			animated_sprite_2d.play("idle")
	else:
		if Global.item_main == 1:
			animated_sprite_2d.play("walk_basic_shovel")
		else:
			animated_sprite_2d.play("walk")
	
	# Movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	
	# If left mouse button is pressed, play mining animation
	if Input.is_action_pressed("mb_left"):
		animated_sprite_2d.play("mine")

	move_and_slide()
	
func player_sell_method(): 
	pass
func player_shop_method(): 
	pass



#inventory stuff
func collect(item):
	inv.insert(item)
