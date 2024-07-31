extends StaticBody2D

func _ready():
	self.z_index = 0
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
	if $shopmenu.item4owned == true:
		Global.damage = 16
		Global.money_multiplier = 7.75
		Global.item_main = 4
	if $shopmenu.item5owned == true:
		Global.damage = 40
		Global.money_multiplier = 10.5
		Global.item_main = 5
	if $shopmenu.item6owned == true:
		Global.damage = 100
		Global.money_multiplier = 25
		Global.item_main = 6
	
func _on_area_2d_body_entered(body):
	if body.has_method("player_shop_method"):
		var audio_player = $ShopAudio
		var audio_stream1 = load("res://Assets/Audio/shop/bd.ogg")
		$shopmenu.visible = true
		audio_player.stream = audio_stream1
		audio_player.play()

func _on_area_2d_body_exited(body):
	var audio_player = $ShopAudio
	var audio_stream1 = load("res://Assets/Audio/shop/bd.ogg")
	$shopmenu.visible = false
	audio_player.stream = audio_stream1
	audio_player.play()
	


