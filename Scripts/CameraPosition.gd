extends Camera2D

@onready var personagem = get_node("/root/Geral/Personagem")
@onready var camera = $"."

func _ready():
	personagem.fightCalled.connect(_CamChange)
	
func _CamChange(isFight: bool):
	if isFight:
		position += Vector2(50, 0)  # Ajusta a posição da câmera para a direita
	else:
		position -= Vector2(50, 0)  # Ajusta a posição da câmera para a esquerda
