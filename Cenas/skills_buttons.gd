extends VBoxContainer





func _ready() -> void:
	hideOrshow()


@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	hideOrshow()

func hideOrshow():
	var children = get_children()
	for child in children:
		if child.skill:
			child.show()
		
