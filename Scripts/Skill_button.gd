extends Button

@export var skill: Skill = Skill.new()


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
	return
	
