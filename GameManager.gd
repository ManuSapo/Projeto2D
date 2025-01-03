extends Node

@onready var player = get_node("/root/Geral/Personagem")
@onready var enemies = get_node("/root/Geral/Enemies")
@export var isFighting: bool = false
@export var difficulty: String = "easy" # Opções: "easy", "medium", "hard"

var EName: String
signal canEnd

func _ready():
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
