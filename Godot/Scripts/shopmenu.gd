extends StaticBody2D

# Item definitions
var item = 1
var item1price = 10
var item2price = 50
var item3price = 125
var item4price = 300
var item5price = 800

var item1owned = false
var item2owned = false
var item3owned = false
var item4owned = false
var item5owned = false

var price

func _ready():
	update_shop_ui()

func _physics_process(_delta):
	if self.visible:
		update_shop_ui()

func update_shop_ui():
	match item:
		1:
			$icon.play("Basic_Shovel")
			$PriceLabel.text = "Simple Shovel:\n$10\n2 Damage\n1.5x Money"
			$ButtonBuy.modulate = Color(0.058, 0.611, 0.098) if Global.money >= item1price and not item1owned else Color(1, 0, 0)
			$ButtonBuy.disabled = Global.money < item1price or item1owned
		2:
			$icon.play("Basic_Pickaxe")
			$PriceLabel.text = "Simple Pickaxe:\n$50\n4 Damage\n2.5x Money"
			$ButtonBuy.modulate = Color(0.058, 0.611, 0.098) if Global.money >= item2price and not item2owned else Color(1, 0, 0)
			$ButtonBuy.disabled = Global.money < item2price or item2owned
		3:
			$icon.play("Small_Drill")
			$PriceLabel.text = "Small Drill:\n$125\n8 Damage\n4x Money"
			$ButtonBuy.modulate = Color(0.058, 0.611, 0.098) if Global.money >= item3price and not item3owned else Color(1, 0, 0)
			$ButtonBuy.disabled = Global.money < item3price or item3owned
		4:
			$icon.play("Medium_Drill")
			$PriceLabel.text = "Medium Drill:\n$300\n16 Damage\n7.75x Money"
			$ButtonBuy.modulate = Color(0.058, 0.611, 0.098) if Global.money >= item4price and not item4owned else Color(1, 0, 0)
			$ButtonBuy.disabled = Global.money < item4price or item4owned
		5:
			$icon.play("Large_Drill")
			$PriceLabel.text = "Large Drill:\n$800\n40 Damage\n10.5x Money"
			$ButtonBuy.modulate = Color(0.058, 0.611, 0.098) if Global.money >= item5price and not item5owned else Color(1, 0, 0)
			$ButtonBuy.disabled = Global.money < item5price or item5owned

func _on_button_left_pressed():
	swap_item_back()

func _on_button_right_pressed():
	swap_item_forward()

func _on_button_buy_pressed():
	print("Buying...")
	match item:
		1:
			price = item1price
			if Global.money >= price and not item1owned:
				buy()
				item1owned = true
				print("Bought Basic Shovel")
		2:
			price = item2price
			if Global.money >= price and not item2owned:
				buy()
				item2owned = true
				print("Bought Basic Pickaxe")
		3:
			price = item3price
			if Global.money >= price and not item3owned:
				buy()
				item3owned = true
				print("Bought Small Drill")
		4:
			price = item4price
			if Global.money >= price and not item4owned:
				buy()
				item4owned = true
				print("Bought Medium Drill")
		5:
			price = item5price
			if Global.money >= price and not item5owned:
				buy()
				item5owned = true
				print("Bought Large Drill")

func swap_item_back():
	var previous_item = item
	match item:
		1:
			item = 5
		2:
			item = 1
		3:
			item = 2
		4:
			item = 3
		5:
			item = 4
	update_shop_ui()

func swap_item_forward():
	match item:
		1:
			item = 2
		2:
			item = 3
		3:
			item = 4
		4:
			item = 5
		5:
			item = 1
	update_shop_ui()

func buy():
	Global.money -= price
	update_shop_ui()
