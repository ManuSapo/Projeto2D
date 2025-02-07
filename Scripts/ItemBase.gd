extends Node2D

@export var itemScript: Inventory_Item = Inventory_Item.new()

@onready var sprite = $TextureRect

func _ready():
	sprite = itemScript.worldSprite
