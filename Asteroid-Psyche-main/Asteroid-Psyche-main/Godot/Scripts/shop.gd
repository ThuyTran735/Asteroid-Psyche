extends StaticBody2D

func _ready():
	$shopmenu.visible = false
	
func _process(_delta):
	if $shopmenu.item1owned == true:
		pass
	if $shopmenu.item2owned == true:
		pass
	
func _on_area_2d_body_entered(body):
	if body.has_method("player_shop_method"):
		$shopmenu.visible = true

func _on_area_2d_body_exited(body):
	$shopmenu.visible = false
