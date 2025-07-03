extends Control

var isShowing: bool

signal opened
signal closed

@export var inventoryResource: Inventory = Inventory.new()
@onready var slots: Array = $border/GridContainer.get_children()
@onready var inventory = inventoryResource
@onready var change = $border/ChangeInv



func _ready() -> void:
	isShowing = false
	self.hide()
	update()
	inventory.updated.connect(update)
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	ShowOrHide()

func update():
	changeInv()

func changeInv():
	if change.number == 0:
		for i in range(min(inventory.slots.size(), slots.size())):
			slots[i].update(inventory.slots[i])
	if change.number == 1:
		for i in range(min(inventory.heal.size(), slots.size())):
			slots[i].update(inventory.heal[i]) 
	if change.number == 2:
		for i in range(min(inventory.loot.size(), slots.size())):
			slots[i].update(inventory.loot[i])
	if change.number == 3:
		for i in range(min(inventory.weapons.size(), slots.size())):
			slots[i].update(inventory.weapons[i])
	if change.number == 4:
		for i in range(min(inventory.runes.size(), slots.size())):
			slots[i].update(inventory.runes[i])
	if change.number == 5:
		for i in range(min(inventory.key.size(), slots.size())):
			slots[i].update(inventory.key[i])

func usedOnChanges(slotU: Inventory_Slot):
	if slotU.item != null:
		for i in range(inventory.heal.size()):
			var heal_slot = inventory.heal[i]
			if heal_slot != null and heal_slot.item == slotU.item:
				heal_slot.amount = slotU.amount
				if heal_slot.amount <= 0:
					heal_slot.item = null
					inventory.heal[i] = heal_slot

func ShowOrHide():
	if isShowing == true:
		if Input.is_action_just_pressed("Inventory"):
			self.hide()
			isShowing = false
			GameManager.player.moveSet()
			GameManager.player.hideOrShow()
			closed.emit()
	elif isShowing == false:
		if Input.is_action_just_pressed("Inventory"):
			self.show()
			isShowing = true
			GameManager.player.moveSet()
			GameManager.player.hideOrShow()
			opened.emit()
			

func ButtonShowHide():
	if isShowing == true:
		self.hide()
		isShowing = false
		GameManager.player.moveSet()
		GameManager.player.hideOrShow()
		closed.emit()
	elif isShowing == false:
		self.show()
		isShowing = true
		GameManager.player.moveSet()
		GameManager.player.hideOrShow()
		opened.emit()

func _on_on_off_pressed():
	ButtonShowHide()
