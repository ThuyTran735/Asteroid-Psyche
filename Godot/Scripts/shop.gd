extends StaticBody2D

func _ready():
	$shopmenu.visible = false
	
func _process(_delta):
	if $shopmenu.item1owned == true:
		Global.money_multiplier = 1.5
		Global.item_main = 1
	if $shopmenu.item2owned == true:
		Global.money_multiplier = 2.25
		Global.item_main = 2
	
func _on_area_2d_body_entered(body):
	if body.has_method("player_shop_method"):
		$shopmenu.visible = true

func _on_area_2d_body_exited(body):
	$shopmenu.visible = false
