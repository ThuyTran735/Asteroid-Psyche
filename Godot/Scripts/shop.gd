extends StaticBody2D

func _ready():
	$shopmenu.visible = false
	
func _process(_delta):
	if $shopmenu.item1owned == true:
		Global.damage = 2
		Global.money_multiplier = 1.5
		Global.item_main = 1
	if $shopmenu.item2owned == true:
		Global.damage = 4
		Global.money_multiplier = 2.5
		Global.item_main = 2
	if $shopmenu.item3owned == true:
		Global.damage = 8
		Global.money_multiplier = 4
		Global.item_main = 3
	
func _on_area_2d_body_entered(body):
	if body.has_method("player_shop_method"):
		$shopmenu.visible = true

func _on_area_2d_body_exited(body):
	$shopmenu.visible = false
