extends Panel

@onready var background: Sprite2D = $Background
@onready var itemSprite: Sprite2D = $CenterContainer/Panel/Item 

func update(item: Inventory_Item):
	if !item:
		background.frame = 1
		itemSprite.visible = false
	else:
		background.frame = 0
		itemSprite.visible = true
		itemSprite.texture = item.texture
