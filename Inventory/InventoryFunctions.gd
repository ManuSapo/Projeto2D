extends Control

var isShowing: bool

func _ready() -> void:
	isShowing = false
	self.hide()


@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	ShowOrHide()

func ShowOrHide():
	if isShowing == true:
		if Input.is_action_just_pressed("Inventory"):
			self.hide()
			isShowing = false
			GameManager.player.moveSet()
	elif isShowing == false:
		if Input.is_action_just_pressed("Inventory"):
			self.show()
			isShowing = true
			GameManager.player.moveSet()
