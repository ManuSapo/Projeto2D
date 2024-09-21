extends TextureProgressBar

@export var enemy = Node

func _ready():
	enemy.EhealthChanged.connect(updateLife)
	updateLife()
	updateLifeSize()
	
@warning_ignore("unused_parameter")
func _process(delta):
	updateLife()
	updateLifeSize()
	
func updateLife():
	if enemy.status:
		value = enemy.status.health * 100 / enemy.status.max_health

func updateLifeSize():
	var new_width = enemy.status.max_health * 0.75
	custom_minimum_size = Vector2(new_width, custom_minimum_size.y)
