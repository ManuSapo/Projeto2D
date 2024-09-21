extends Node

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	moveController()
	


func moveController():
	if GameManager.isFighting:
		var enemysOnScene = get_children()
		for child in enemysOnScene:
			child.canMove = false
			return
	else:
		var enemysOnScene = get_children()
		for child in enemysOnScene:
			child.canMove = true
			return
