extends Panel

@onready var background: Sprite2D = $Background
@onready var itemSprite: Sprite2D = $CenterContainer/Panel/Item 
@onready var itemAmount: Label = $TextureRect/Label
@onready var textDisplay = $NinePatchRect
@onready var closeButton = $"close button"
var slot_data: Inventory_Slot

var isShowing: bool = false
var isItem: bool = false


func _ready() -> void:
	GameManager.InvUseButton.connect(_on_use_pressed)

func update(slot: Inventory_Slot):
	slot_data = slot
	if !slot_data.item:
		background.frame = 0
		itemSprite.visible = false
		background.modulate = Color(0.9, 0.9, 0.9, 1)
		itemAmount.visible = false
		textDisplay.visible = false
		isItem = false
	else:
		background.frame = 1
		itemSprite.visible = true
		itemSprite.texture = slot.item.texture
		background.modulate = Color(1, 1, 1, 1)
		itemAmount.visible = true
		itemAmount.text = str(slot.amount)
		isItem = true


#region general button
func _on_button_pressed() -> void:
	if isItem == true:
		if !isShowing:
			textDisplay.visible = true
			isShowing = true
			closeButton.visible = true
			print("foi mostrar")
		else:
			textDisplay.visible = false
			isShowing = false
			print("foi não mostrar")
	else:
		textDisplay.visible = false
		print("foi não mostrar de novo")
		return
	


func _on_close_button_pressed() -> void:
	print(closeButton.visible)
	if isShowing == true:
		_on_button_pressed()
		closeButton.visible = false
		print(closeButton.visible)
#endregion 



func _on_use_pressed():
	if slot_data and slot_data.item:
		slot_data.item.use()


func _on_delete_pressed() -> void:
	pass # Replace with function body.


func _on_read_pressed() -> void:
	pass # Replace with function body.


func _on_use_mouse_entered() -> void:
	print("MOUSE ENTROU PORRA")


func _on_use_mouse_exited() -> void:
	print("MOUSE SAIU PORRA")
