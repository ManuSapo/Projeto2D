extends Resource
class_name Inventory


@export var ActualInventory: inventoryType = inventoryType.empty

enum inventoryType { empty, player, npc, enemy, chest, reward }
