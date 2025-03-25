extends Resource
class_name Inventory

@export var actual_inventory: inventoryType = inventoryType.empty
@export var items: Array[Inventory_Item]


enum inventoryType { empty, player, npc, enemy, chest, reward }
