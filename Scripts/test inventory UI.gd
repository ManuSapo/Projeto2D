extends NinePatchRect

@onready var button = $VBoxContainer/Button
@onready var button2 = $VBoxContainer/Button2
@onready var label = $VBoxContainer/Label

func _on_button_mouse_entered() -> void:
	label.text = "mouse entrou no " + button.name


func _on_button_mouse_exited() -> void:
	label.text = "mouse saiu do " + button.name


func _on_button_pressed() -> void:
	label.text = "apertou o " + button.name


func _on_button_2_mouse_entered() -> void:
	label.text = "mouse entrou no " + button.name


func _on_button_2_mouse_exited() -> void:
	label.text = "mouse saiu do " + button.name


func _on_button_2_pressed() -> void:
	label.text = "apertou o " + button.name


func _on_button_3_mouse_entered() -> void:
	label.text = "mouse entrou no " + button.name


func _on_button_3_mouse_exited() -> void:
	label.text = "mouse saiu do " + button.name


func _on_button_3_pressed() -> void:
	label.text = "apertou o " + button.name
