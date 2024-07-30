extends StaticBody2D

# Item 1 = Basic Shovel, Item 2 = Basic Pickaxe, Item 3 = Basic Gun
var item = 1

var item1price = 10
var item2price = 50
var item3price = 100

var item1owned = false
var item2owned = false
var item3owned = false

var price

# Inventory stuff
@export var item_a: InvItem
var player = null

func _ready():
	$icon.play("Basic_Shovel")
	item = 1

	# Initialize the player variable (assuming Billy is the player node)
	player = get_parent().get_node("../Billy") # Adjust the path as necessary
	if player == null:
		print("Player node not found!")
	else:
		print("Player node found:", player)

func _physics_process(_delta):
	if self.visible == true:
		if item == 1:
			$icon.play("Basic_Shovel")
		if item == 2:
			$icon.play("Basic_Pickaxe")
		if item == 3:
			$icon.play("Basic_Gun")

func _on_button_left_pressed():
	swap_item_back()

func _on_button_right_pressed():
	swap_item_forward()
func up():
	player = get_node(".") # Adjust the path as necessary
	if player:
	# Create a Callable for the method you want to connect
		var callable = Callable(self, "_on_inventory_updated")
		if not player.is_connected("inventory_updated", callable):
			player.connect("inventory_updated", callable)
			print("Connected to inventory_updated signal")
	else:
		print("Player node not found or incorrect path")
func _on_button_buy_pressed():
	print("Buying...")
	if item == 1:
		price = item1price
		if Global.money >= price and not item1owned:
			if player != null:
				if player.add_to_displayed_inventory("res://Inventory/Items/Basic_Shovel.tres"):
					buy()
					print("Bought Basic Shovel")
					player.print_inventory_contents()
					up()

				else:
					print("No available slot for the Basic Shovel!")
			else:
				print("Player is null!")
	elif item == 2:
		price = item2price
		if Global.money >= price and not item2owned:
			if player != null:
				if player.add_to_displayed_inventory("res://Inventory/Items/Basic_Pickaxe.tres"):
					buy()
					print("Bought Basic Pickaxe")
				else:
					print("No available slot for the Basic Pickaxe!")
			else:
				print("Player is null!")
	elif item == 3:
		price = item3price
		if Global.money >= price and not item3owned:
			if player != null:
				if player.add_to_displayed_inventory("res://Inventory/Items/Basic_Gun.tres"):
					buy()
					print("Bought Basic Gun")
				else:
					print("No available slot for the Basic Gun!")
			else:
				print("Player is null!")

func swap_item_back():
	if item == 1:
		item = 3
	elif item == 2:
		item = 1
	elif item == 3:
		item = 2

func swap_item_forward():
	if item == 1:
		item = 2
	elif item == 2:
		item = 3
	elif item == 3:
		item = 1

func buy():
	Global.money -= price
	if item == 1:
		item1owned = true
	if item == 2:
		item2owned = true
	if item == 3:
		item3owned = true
