extends Button

@export var skill: Skill = Skill.new()

func _ready() -> void:
	pass

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass
	
	
func set_skill():
	icon = skill.icon
