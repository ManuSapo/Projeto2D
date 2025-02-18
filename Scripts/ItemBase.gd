extends Node2D

@export var itemScript: Inventory_Item = Inventory_Item.new()

@onready var sprite = $TextureRect
@onready var Collision = $Area2D/CollisionShape2D
@onready var Area = $Area2D
@onready var player = GameManager.player

func _ready():
	onStart()


func onStart():
	
	pass
	

func interaction():
	
	pass


@warning_ignore("unused_parameter")
func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		#here the code will call the into the inventory function
		pass
		
			
			
	pass # Replace with function body.
