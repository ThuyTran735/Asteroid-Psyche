extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var amount_text: Label = $CenterContainer/Panel/Label
@onready var animated_sprite_2d = $AnimatedSprite2D

func update(slot: InvSlot):
	if !slot.item:
		item_visual.visible = false
		amount_text.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = slot.item.texture		
		if slot.amount > 1:
			amount_text.visible = true
		amount_text.text = str(slot.amount)
		animated_sprite_2d.play("shovel")
