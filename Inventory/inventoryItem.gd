extends Resource
class_name Inventory_Item

@export var name: String = "Empty"
@export var texture: Texture2D
@export var shopDescription: String = "The shop description"
@export var generalDescription: String = "The general description"
@export var effectDescription: String = "The effect description"
@export var price: int
@export var heal: int
@export var damage: int
@export var item_type: ItemType = ItemType.DAMAGE
@export var tag: tagInv = tagInv.HEAL

enum ItemType { DAMAGE, HEAL, SELL, ARMOR, WEAPON, AMMO, OTHER }
enum tagInv { HEAL, LOOT, WEAPONS, RUNE, KEY }

func use():
	print("item used is ", self.name)
