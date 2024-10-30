extends Node

@onready var player = get_node("/root/Geral/Personagem")
@onready var enemies = get_node("/root/Geral/Enemies")
@export var isFighting: bool = false
@export var difficulty: String = "easy" # Opções: "easy", "medium", "hard"

var EName: String
signal canEnd

func _ready():
	set_difficulty_parameters() # Define os parâmetros da dificuldade
	pass
	
@warning_ignore("unused_parameter")
func _process(delta):
	_whenFighting()

func _whenFighting():
	pass
	
func Enemy(enemy):
	if enemy is CharacterBody2D:
		if enemy.canMove:
			moveController()
			enemy.position = player.position + Vector2(100,10)
			isFighting = true
			await canEnd
			moveController()
			isFighting = false
			return

func moveController():
	var enemysOnScene = enemies.get_children()
	for child in enemysOnScene:
		child.changeMove()

# Define os parâmetros com base na dificuldade
func set_difficulty_parameters():
	match difficulty:
		"easy":
			player.max_health = 200
			for enemy in enemies.get_children():
				enemy.attack_power = 10
		"medium":
			player.max_health = 150
			for enemy in enemies.get_children():
				enemy.attack_power = 20
		"hard":
			player.max_health = 100
			for enemy in enemies.get_children():
				enemy.attack_power = 30
