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
	if change.number == 0:
		pass

func update():
	for i in range(min(inventory.slots.size(), slots.size())):
		slots[i].update(inventory.slots[i])


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
