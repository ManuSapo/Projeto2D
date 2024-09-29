extends Control

@onready var player = get_node("/root/Geral/Personagem")
var enemy
var actualTurn: String
var actualSkill: Skill


func _ready():
	pass
	
	
@warning_ignore("unused_parameter")

func _process(delta):
	pass
	
	
	
func _startFight():
	actualTurn = "start"
	pass
	
func _calculating():
	pass
	
func _middleFight():
	pass
	
func _endFight():
	pass



func _useSkill(actualSkill):
	if actualTurn == "start":
		pass











func _on_skill_1_pressed() -> void:
	actualSkill = $SkillsButtons/Skill1.skill
	_useSkill(actualSkill)


func _on_skill_2_pressed() -> void:
	pass # Replace with function body.


func _on_skill_3_pressed() -> void:
	pass # Replace with function body.


func _on_skill_4_pressed() -> void:
	pass # Replace with function body.


func _on_skill_5_pressed() -> void:
	pass # Replace with function body.


func _on_skill_6_pressed() -> void:
	pass # Replace with function body.


func _on_skill_7_pressed() -> void:
	pass # Replace with function body.


func _on_skill_8_pressed() -> void:
	pass # Replace with function body.


func _on_skill_9_pressed() -> void:
	pass # Replace with function body.
