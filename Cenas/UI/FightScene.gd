extends Control

@onready var initialButtons = get_node("../Camera2D/FightUI/LayoutUI/InitialButtons")
@onready var fightButtons = get_node("../Camera2D/FightUI/LayoutUI/FightButtons")
@onready var FightUI = get_node("../Camera2D/FightUI/")
@onready var fightButton = get_node("../Camera2D/FightUI/LayoutUI/InitialButtons/HBoxContainer/Fight")
@onready var backButton = get_node("../Camera2D/FightUI/LayoutUI/InitialButtons/HBoxContainer/Back")
@onready var player = get_node("/root/Geral/Personagem")
@onready var enemyStats
@onready var actualEnemy: CharacterBody2D

@export var Actual_Status: actualStatusEnemy = actualStatusEnemy.empty

var actualTurn: String = "start"
var actualSkill
var isFighthing: bool
var textShowing: bool = false

enum actualStatusEnemy { empty, poison, fire, shock, stun, bleed }

signal turnEnded


func _ready():
	onReadyGeneral()
	player.notRunning()
@warning_ignore("unused_parameter")

func _process(delta):
	uiColor()
	

func _startFight():
	actualTurn = "start"
	onReadyGeneral()
	return
	
func _middleFight():
	pass
		
func _endFight():
	pass

func _enemyUseSkill():
	actualEnemy.status.statusDamages()
	actualEnemy.status.onlyPoison()

func _useSkill():
	if actualTurn == "start":
		if actualSkill.skill_type == 0:
			var damageGiven: int
			damageGiven = (actualSkill.Damage + player.status.attack) - (enemyStats.defense * 0.66)
			round(damageGiven)
			actualEnemy.status.takeDamage(damageGiven)
			print(actualEnemy.name)
			print(enemyStats.health)
			player.status.statusDamages()
			changeStatus()
		elif actualSkill.skill_type == 1:
			var healGiven: int
			healGiven = (actualSkill.Damage + player.status.defense * 0.66)
			round(healGiven)
			player.status.shielding(healGiven)
			player.status.heal(healGiven)
			print(healGiven)
			player.status.statusDamages()
			changeStatus()
	print(actualEnemy.status.Actual_Status)

func _calculating():
	if player.status.speed > enemyStats.speed:
		print("player atacou antes")
		_useSkill()
		_enemyUseSkill()
		enemyStatusDamages()
	elif enemyStats.speed > player.status.speed:
		print("inimigo atacou antes")
		_enemyUseSkill()
		_useSkill()

func changeStatus():
	if actualSkill.status_type == 1:
		Actual_Status = 1
	elif actualSkill.status_type == 2: 
		Actual_Status = 2
	elif actualSkill.status_type == 3: 
		Actual_Status = 3
	
	

func enemyStatusDamages():
	if Actual_Status == 1:
		var poisonDamage
		poisonDamage = enemyStats.max_health * 0.2
		@warning_ignore("narrowing_conversion")
		enemyStats.temp_defense -= enemyStats.defense * 0.85
		print(enemyStats.temp_defense)
		print(poisonDamage)
		enemyStats.health -= poisonDamage
		if enemyStats.health < 0:
			enemyStats.health = 0
			print("player died")
	elif Actual_Status == 2:
		var fireDamage
		fireDamage = enemyStats.max_health * 0.05
		@warning_ignore("narrowing_conversion")
		enemyStats.temp_attack = enemyStats.attack * 0.85
		print(enemyStats.temp_attack)
		print(fireDamage)
		enemyStats.health -= fireDamage
		if enemyStats.health < 0:
			enemyStats.health = 0
			print("player died")
	elif Actual_Status == 3:
		var shockDamage
		shockDamage = enemyStats.max_health * 0.1
		@warning_ignore("narrowing_conversion")
		enemyStats.temp_speed = enemyStats.speed * 0.85
		print(enemyStats.temp_speed)
		print(shockDamage)
		enemyStats.health -= shockDamage
		if enemyStats.health < 0:
			enemyStats.health = 0
			print("player died")
	elif Actual_Status == 4:
		var beforeStun
		beforeStun = enemyStats.temp_attack
		enemyStats.temp_attack = 0
		await turnEnded
		enemyStats.temp_attack = beforeStun
		print(enemyStats.temp_speed)
	elif Actual_Status == 0:
		enemyStats.temp_attack = enemyStats.attack
		enemyStats.temp_defense = enemyStats.defense
		enemyStats.temp_speed = enemyStats.speed

	
func uiColor():
	if player.status.Actual_Status == 0:
		FightUI.modulate = Color(1, 1, 1, 1)
	elif player.status.Actual_Status == 1:
		FightUI.modulate = Color(1, 0.73, 1, 1)
	elif player.status.Actual_Status == 2:
		FightUI.modulate = Color(1, 0.43, 0.13, 1)
	elif player.status.Actual_Status == 3:
		FightUI.modulate = Color(0, 0.83, 1, 1)
		
		
		
		
		
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
	actualEnemy.status.Actual_Status = 0
	player.status.Actual_Status = 0
	GameManager.canEnd.emit()

func _on_back_pressed() -> void:
	fightButton.show()
	backButton.hide()
	fightButtons.hide()

@warning_ignore("shadowed_variable")
func enemyStatus(enemy):
	if enemy is CharacterBody2D:
		actualEnemy = enemy
		enemyStats = enemy.status




func _on_skill_1_pressed() -> void:
	# Certifique-se de que o caminho está correto:
	actualSkill = get_node("../Camera2D/FightUI/LayoutUI/FightButtons/ScrollContainer/SkillsButtons/Skill1").skill
	print("Skill 1 apertada, skill: ", actualSkill.Name)
	_calculating()

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
