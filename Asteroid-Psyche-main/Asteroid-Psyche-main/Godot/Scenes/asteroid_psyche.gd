extends Node2D



func update_money():
	Global.previous_money = Global.current_money
	if Global.current_money > Global.money:
		Global.money = Global.current_money

func _ready() -> void:
	update_money()
