extends Control

@onready var player = get_node("/root/Geral/Personagem") 
@export var enemys: Array[PackedScene] = []
var enemy

func _ready():
	pass
	
	
@warning_ignore("unused_parameter")

func _process(delta):
	pass
	
	
	
func _startFight():
	GameManager.isFighting = true
	player.canMove = false
	player.overworldBars.hide()
	player.fightBars.show()
	pass
	
func _middleFight():
	pass
	
func _endFight():
	player.canMove = true
	player.fightBars.hide()
	player.overworldBars.show()
	GameManager.isFighting = false
	pass
