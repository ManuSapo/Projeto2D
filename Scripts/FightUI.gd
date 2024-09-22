extends Control

@onready var personagem = get_node("../..")
@onready var initialButtons = $"Layout UI/InitialButtons"
@onready var fightButtons = $"Layout UI/FightButtons"
@onready var fightButton = $"Layout UI/InitialButtons/HBoxContainer/Fight"
@onready var backButton = $"Layout UI/InitialButtons/HBoxContainer/Back"

var actualEnemy

@warning_ignore("unused_signal")
signal fightCalled
@warning_ignore("unused_signal")
signal fightEnded

func _ready():
	onReadyGeneral()

@warning_ignore("unused_parameter")
func _process(delta):
	pass

func onReadyGeneral():
	initialButtons.show()
	fightButtons.hide()
	backButton.hide()


func getSkills():
	pass

func useSkill():
	pass


func hideInitial():
	pass


#UI Buttons

func _on_fight_pressed():
	fightButton.hide()
	fightButtons.show()
	backButton.show()



func _on_itens_pressed():
	pass # Replace with function body.





func _on_run_pressed():
	personagem._enemyFight()
	GameManager.canEnd.emit()

#Fight Buttons

func _on_back_pressed() -> void:
	fightButton.show()
	backButton.hide()
	fightButtons.hide()

#Skills Buttons

func _on_skill_1_pressed():
	pass # Replace with function body.

func _on_skill_2_pressed():
	pass # Replace with function body.


func _on_skill_3_pressed():
	pass # Replace with function body.
