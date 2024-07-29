extends Resource
class_name Inv

signal update

@export var slots: Array[InvSlot] = []

func insert(item: InvItem):
	var itemslots = slots.filter(func(slot: InvSlot): return slot.item == item)
	if not itemslots.is_empty():
		itemslots[0].amount += 1
	else:
		var emptyslots = slots.filter(func(slot: InvSlot): return slot.item == null)
		if not emptyslots.is_empty():
			emptyslots[0].item = item
			emptyslots[0].amount = 1
	emit_signal("update")
