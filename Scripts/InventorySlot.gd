extends Resource

class_name Inventory_Slot

@export var item: Inventory_Item
@export var amount: int

func duplicate_slot() -> Inventory_Slot:
	var new_slot = duplicate() as Inventory_Slot
	new_slot.item = item.duplicate() if item else null
	return new_slot

func use_item():
	if item and amount > 0:
		item.use()
		amount -= 1
		if amount <= 0:
			item = null
			amount = 0
