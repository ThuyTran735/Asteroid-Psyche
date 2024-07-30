extends CharacterBody2D

const SPEED = 50
const JUMP_VELOCITY = -200

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite_2d = $AnimatedSprite2D

# Inventory stuff
@export var inv_resource: Resource # Assign your Inv resource in the editor

var inv: Inv
var inventory = []
signal inventory_updated

func _ready():
	var player_inventory_resource = load("res://Inventory/playerinv.tres") as Resource
	if player_inventory_resource:
		inventory = player_inventory_resource.get("slots")

# Function to add a specific item to the displayed inventory
func add_to_displayed_inventory(item_path: String):
	var new_item = ResourceLoader.load(item_path) as InvItem
	if new_item == null:
		print("Item could not be loaded:", item_path)
		return false
	
	for slot in inventory:
		if slot.item == null:
			slot.item = new_item
			slot.amount = 1
			print("Added item to displayed inventory:", new_item)
			emit_signal("inventory_updated")
			print_inventory_contents() # Print the inventory after adding an item
			return true
		elif slot.item == new_item:
			slot.amount += 1
			print("Increased item amount in displayed inventory:", new_item)
			emit_signal("inventory_updated")
			print_inventory_contents() # Print the inventory after increasing the amount
			return true
	
	print("No available slot for the item:", new_item)
	print_inventory_contents() # Print the inventory if no slot was available
	return false

# Function to print the inventory contents
func print_inventory_contents():
	print("Current inventory contents:")
	for slot in inventory:
		if slot.item != null:
			print("Item:", slot.item.resource_path, "Amount:", slot.amount)
		else:
			print("Empty slot")
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

# Inventory stuff
func collect(item):
	if inv != null:
		inv.insert(item)
	else:
		print("Inventory is null!")
