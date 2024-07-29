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

# inventiry stuff
@export var item_a: InvItem
var player = null



func _ready():
	$icon.play("Basic_Shovel")
	item = 1

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
func _on_button_buy_pressed():
	print("Buying...")
	if item == 1:
		price = item1price
		if Global.money >= price:
			if item1owned == false:
				#probably broken (doesnt know what item)
				player.collect(item_a)
				buy()
				print("Bought Basic Shovel")
	elif item == 2: 
		price = item2price
		if Global.money >= price:
			if item2owned == false:
				player.collect(item_a)
				buy()
	elif item == 3: 
		price = item3price
		if Global.money >= price:
			if item3owned == false:
				player.collect(item_a)
				buy()

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
