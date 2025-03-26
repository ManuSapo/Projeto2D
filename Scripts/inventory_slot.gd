extends Panel

@onready var background: Sprite2D = $Background
@onready var itemSprite: Sprite2D = $CenterContainer/Panel/Item 

func update(slot: Inventory_Slot):
	if !slot.item:
		background.frame = 0
		itemSprite.visible = false
		background.modulate = Color(0.9, 0.9, 0.9, 1)
	else:
		background.frame = 1
		itemSprite.visible = true
		itemSprite.texture = slot.item.texture
		background.modulate = Color(1, 1, 1, 1)
