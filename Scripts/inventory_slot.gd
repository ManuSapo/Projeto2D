extends Panel

@onready var background: Sprite2D = $Background
@onready var itemSprite: Sprite2D = $CenterContainer/Panel/Item 
@onready var itemAmount: Label = $TextureRect/Label
@onready var textDisplay = $NinePatchRect

func update(slot: Inventory_Slot):
	if !slot.item:
		background.frame = 0
		itemSprite.visible = false
		background.modulate = Color(0.9, 0.9, 0.9, 1)
		itemAmount.visible = false
		textDisplay.visible = false
	else:
		background.frame = 1
		itemSprite.visible = true
		itemSprite.texture = slot.item.texture
		background.modulate = Color(1, 1, 1, 1)
		itemAmount.visible = true
		itemAmount.text = str(slot.amount)
		textDisplay.visible = true
