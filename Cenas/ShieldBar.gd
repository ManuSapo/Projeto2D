extends TextureProgressBar

@onready var player = get_node("/root/Geral/Personagem")

func _ready():
	updateShield()
	updateShieldSize()
	
@warning_ignore("unused_parameter")
func _process(delta):
	updateShield()
	updateShieldSize()
	
func updateShield():
	if player.status:
		value = player.status.shield * 100 / player.status.max_health

func updateShieldSize():
	var new_width = player.status.max_health * 0.75
	custom_minimum_size = Vector2(new_width, custom_minimum_size.y)
