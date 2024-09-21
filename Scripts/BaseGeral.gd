extends Node2D

@onready var player = $Personagem
@export var enemys: Array[PackedScene] = []

func _ready():
	pass
	
@warning_ignore("unused_parameter")
func _process(delta):
	pass
	


func _on_personagem_stop_everything() -> void:
	get_tree().paused = true


func _on_personagem_move_everything() -> void:
	get_tree().paused = true
