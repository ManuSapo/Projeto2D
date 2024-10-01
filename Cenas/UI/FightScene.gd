extends Control

@onready var initialButtons = get_node("../Camera2D/FightUI/LayoutUI/InitialButtons")
@onready var fightButtons = get_node("../Camera2D/FightUI/LayoutUI/FightButtons")
@onready var fightButton = get_node("../Camera2D/FightUI/LayoutUI/InitialButtons/HBoxContainer/Fight")
@onready var backButton = get_node("../Camera2D/FightUI/LayoutUI/InitialButtons/HBoxContainer/Back")
@onready var player = get_node("/root/Geral/Personagem")

var enemy
var actualTurn: String = "start"
var actualSkill


func _ready():
	onReadyGeneral()
	
	
@warning_ignore("unused_parameter")

func _process(delta):
	pass
	



func _startFight():
	actualTurn = "start"
	onReadyGeneral()
	return
	
func _middleFight():
	pass
		
func _endFight():
	pass



func _useSkill():
	if actualTurn == "start":
		onHideAll()
		player.endTurn()
		actualTurn = "Calculating"

func _calculating():
	pass

func onHideAll():
	initialButtons.hide()

func onReadyGeneral():
	initialButtons.show()
	fightButtons.hide()
	backButton.hide()

func _on_fight_pressed():
	fightButton.hide()
	fightButtons.show()
	backButton.show()

func _on_itens_pressed():
	pass # Replace with function body.

func _on_run_pressed():
	player._enemyFight()
	GameManager.canEnd.emit()

func _on_back_pressed() -> void:
	fightButton.show()
	backButton.hide()
	fightButtons.hide()







func _on_skill_1_pressed() -> void:
	# Certifique-se de que o caminho está correto:
	actualSkill = get_node("../Camera2D/FightUI/LayoutUI/FightButtons/ScrollContainer/SkillsButtons/Skill1").skill
	print("Skill 1 apertada, skill: ", actualSkill.Name)
	_useSkill()

func _on_skill_2_pressed() -> void:
	actualSkill = get_node("../Camera2D/FightUI/LayoutUI/FightButtons/ScrollContainer/SkillsButtons/Skill2").skill
	print("Skill 2 apertada, skill: ", actualSkill.Name)
	_useSkill()

func _on_skill_3_pressed() -> void:
	actualSkill = get_node("../Camera2D/FightUI/LayoutUI/FightButtons/ScrollContainer/SkillsButtons/Skill3").skill
	print("Skill 3 apertada, skill: ", actualSkill.Name)
	_useSkill()

func _on_skill_4_pressed() -> void:
	actualSkill = get_node("../Camera2D/FightUI/LayoutUI/FightButtons/ScrollContainer/SkillsButtons/Skill4").skill
	print("Skill 4 apertada, skill: ", actualSkill.Name)
	_useSkill()

func _on_skill_5_pressed() -> void:
	actualSkill = get_node("../Camera2D/FightUI/LayoutUI/FightButtons/ScrollContainer/SkillsButtons/Skill5").skill
	print("Skill 5 apertada, skill: ", actualSkill.Name)
	_useSkill()

func _on_skill_6_pressed() -> void:
	actualSkill = get_node("../Camera2D/FightUI/LayoutUI/FightButtons/ScrollContainer/SkillsButtons/Skill6").skill
	print("Skill 6 apertada, skill: ", actualSkill.Name)
	_useSkill()

func _on_skill_7_pressed() -> void:
	actualSkill = get_node("../Camera2D/FightUI/LayoutUI/FightButtons/ScrollContainer/SkillsButtons/Skill7").skill
	print("Skill 7 apertada, skill: ", actualSkill.Name)
	_useSkill()

func _on_skill_8_pressed() -> void:
	actualSkill = get_node("../Camera2D/FightUI/LayoutUI/FightButtons/ScrollContainer/SkillsButtons/Skill8").skill
	print("Skill 8 apertada, skill: ", actualSkill.Name)
	_useSkill()

func _on_skill_9_pressed() -> void:
	actualSkill = get_node("../Camera2D/FightUI/LayoutUI/FightButtons/ScrollContainer/SkillsButtons/Skill9").skill
	print("Skill 9 apertada, skill: ", actualSkill.Name)
	_useSkill()
