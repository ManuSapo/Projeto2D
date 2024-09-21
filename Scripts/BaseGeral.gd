extends Node2D

@onready var player = $Personagem
@onready var enemys = $Enemies

func _ready():
	pass
	
@warning_ignore("unused_parameter")
func _process(delta):
	pass
	


func _on_personagem_stop_everything() -> void:
	pass


func _on_personagem_move_everything() -> void:
	pass
