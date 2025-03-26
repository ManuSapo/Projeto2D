extends Resource
class_name Inventory

@export var actual_inventory: inventoryType = inventoryType.empty
@export var slots: Array[Inventory_Slot]

signal updated

enum inventoryType { empty, player, npc, enemy, chest, reward }

func insert(item: Inventory_Item):
	for slot in slots:
		if slot.item == item:
			slot.amount += 1
			updated.emit()
			
			print(slot.amount)
			return
	
	for i in range(slots.size()):
		if !slots[i].item:
			slots[i].item = item
			slots[i].amount = 1
			updated.emit()
			return
