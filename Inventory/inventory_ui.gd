extends Resource
class_name Inventory

@export var actual_inventory: inventoryType = inventoryType.empty
@export var slots: Array[Inventory_Slot]
var amountdelete: int
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


func takeout(item: Inventory_Item):
	for slot in slots:
		if slot.item == item:
			slot.amount -= 1
			
			if slot.amount <= 0:
				slot.item = null
				slot.amount = 0
			updated.emit()
			print(slot.amount)
			return


func takeamount(item: Inventory_Item, quantity: int):
	for slot in slots:
		if slot.item == item:
			if slot.amount >= quantity:
				slot.amount -= quantity
				if slot.amount <= 0:
					slot.item = null
					slot.amount = 0
					updated.emit()

func insertamount(item: Inventory_Item, quantity: int):
	for slot in slots:
		if slot.item == item:
			slot.amount += quantity
			updated.emit()
			return

	for slot in slots:
		if slot.item == null:
			slot.item = item
			slot.amount = quantity
			updated.emit()
			return

 
