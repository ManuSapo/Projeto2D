extends TextureProgressBar

@onready var player = get_node("/root/Geral/Personagem")

func _ready():
	player.manaChanged.connect(updateMana)
	updateMana()
	updateManaSize()

@warning_ignore("unused_parameter")
func _process(delta):
	updateMana()
	updateManaSize()

func updateMana():
	if player.status:
		value = player.status.mana * 100 / player.status.max_mana

func updateManaSize():
	var new_width = player.status.max_mana * 0.75
	custom_minimum_size = Vector2(new_width, custom_minimum_size.y)
