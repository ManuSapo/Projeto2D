extends Node

@onready var player = get_node("/root/Geral/Personagem")
@onready var enemies: Array[PackedScene] = []
@export var isFighting: bool = false
var EName: String
var actualEnemy

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
			enemy.canMove = false
			print(enemy.canMove)
			enemy.position = player.position + Vector2(100,10)
			actualEnemy = enemy
		else:
			enemy.canMove = true
			print(enemy.canMove)
			actualEnemy = null
