extends Button

@export var skill: Skill = Skill.new()
@onready var textbox = $Panel
@onready var theText = $Panel/RichTextLabel

func _ready() -> void:
	set_skill()

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	set_skill()
	
	
func set_skill():
	icon = skill.icon
	if !icon:
		hide()
	else:
		show()
		theText.text = str(skill.Damage) + " damage"
	return
	



func _on_mouse_entered() -> void:
	textbox.show()
	print("entrou")
	
func _on_mouse_exited() -> void:
	textbox.hide()
	print("saiu")
