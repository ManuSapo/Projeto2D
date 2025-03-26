extends Control

var isShowing: bool

signal opened
signal closed

@export var inventoryResource: Inventory = Inventory.new()

@onready var slots: Array = $border/GridContainer.get_children()
@onready var inventory = inventoryResource


func _ready() -> void:
	isShowing = false
	self.hide()
	update()
	inventory.updated.connect(update)
	
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	ShowOrHide()

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
