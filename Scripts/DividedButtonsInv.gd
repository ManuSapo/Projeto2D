extends NinePatchRect

@onready var label = $Label
@warning_ignore("unused_signal")
signal button_used



func _on_use_mouse_entered() -> void:
	label.text = "mouse entrou no " + self.name


func _on_use_mouse_exited() -> void:
	label.text = "mouse saiu do " + self.name


func _on_use_pressed() -> void:
	pass


func _on_delete_mouse_entered() -> void:
	label.text = "mouse entrou no " + self.name


func _on_delete_mouse_exited() -> void:
	label.text = "mouse saiu do " + self.name


func _on_delete_pressed() -> void:
	label.text = "apertou o " + self.name


func _on_read_mouse_entered() -> void:
	label.text = "mouse entrou no " + self.name


func _on_read_mouse_exited() -> void:
	label.text = "mouse saiu do " + self.name


func _on_read_pressed() -> void:
	label.text = "apertou o " + self.name
