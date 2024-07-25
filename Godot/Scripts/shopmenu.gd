extends StaticBody2D

# Item 1 = Basic Shovel, Item 2 = Basic Pickaxe
var item = 1

var item1price = 10
var item2price = 50

var item1owned = false
var item2owned = false

var price

func _ready():
	$icon.play("Basic_Shovel")
	item = 1

func _physics_process(_delta):
	if self.visible == true:
		if item == 1:
			$icon.play("Basic_Shovel")
		if item == 2:
			$icon.play("Basic_Pickaxe")


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
				buy()
				print("Bought Basic Shovel")
	elif item == 2: 
		price = item2price
		if Global.money >= price:
			if item2owned == false:
				buy()

func swap_item_back():
	if item == 1:
		item = 2
	elif item == 2:
		item = 1
func swap_item_forward():
	if item == 1:
		item = 2
	elif item == 2:
		item = 1

func buy():
	Global.money -= price
	if item == 1:
		item1owned = true
	if item == 2:
		item2owned = true
