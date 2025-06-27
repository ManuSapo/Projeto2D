extends Resource
class_name Inventory

@export var actual_inventory: inventoryType = inventoryType.empty
@export var slots: Array[Inventory_Slot]
@export var heal: Array[Inventory_Slot]
@export var loot: Array[Inventory_Slot]
@export var weapons: Array[Inventory_Slot]
@export var runes: Array[Inventory_Slot]
@export var key: Array[Inventory_Slot]
var amountdelete: int
signal updated

enum inventoryType { empty, player, npc, enemy, chest, reward }

func insert(item: Inventory_Item):
	for slot in slots:
		if slot.item == item:
			slot.amount += 1
			updated.emit()
			insertOnOther(item)
			return
	
	for i in range(slots.size()):
		if !slots[i].item:
			slots[i].item = item
			slots[i].amount = 1
			updated.emit()
			insertOnOther(item)
			return

#region other things
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
#endregion

func insertOnOther(invItem: Inventory_Item):
	if invItem.tag == 0:
		print(invItem.name)
		for slot in heal:
			if slot.item == invItem:
				slot.amount +=1
				updated.emit()
				return
		for i in range(heal.size()):
			if !heal[i].item:
				heal[i].item = invItem
				heal[i].amount = 1
				updated.emit()
				return
	if invItem.tag == 1:
		print(invItem.name)
		for slot in loot:
			if slot.item == invItem:
				slot.amount +=1
				updated.emit()
				print(slot.item.name)
				return
		for i in range(loot.size()):
			if !loot[i].item:
				loot[i].item = invItem
				loot[i].amount = 1
				updated.emit()
				print(loot[i].item.name)
				return
 
