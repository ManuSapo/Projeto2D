extends Control

@onready var UI = $"../.."
@onready var label = $NinePatchRect/Label
@export var number: int = 0


@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if number == 0:
		label.text = str("All")
	elif number == 1:
		label.text = str("Heal")
	elif number == 2:
		label.text = str("Loot")
	elif number == 3:
		label.text = str("Weapons")
	elif number == 4:
		label.text = str("Runes")
	elif number == 5:
		label.text = str("Key")
	if number > 5:
		number = 0
	if number < 0:
		number = 5

func _on_plus_one_pressed() -> void:
	number = number+1
	UI.changeInv()

func _on_minus_one_pressed() -> void:
	number = number-1
	UI.changeInv()
