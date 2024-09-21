extends TextureProgressBar

@onready var player = get_node("/root/Geral/Personagem")

func _ready():
	player.healthChanged.connect(updateLife)
	updateLife()
	updateLifeSize()
	
@warning_ignore("unused_parameter")
func _process(delta):
	updateLife()
	updateLifeSize()
	
func updateLife():
	if player.status:
		value = player.status.health * 100 / player.status.max_health

func updateLifeSize():
	var new_width = player.status.max_health * 0.75
	custom_minimum_size = Vector2(new_width, custom_minimum_size.y)
