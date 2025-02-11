extends Node2D

@export var itemScript: Inventory_Item = Inventory_Item.new()

@onready var sprite = $TextureRect
@onready var Collision = $Area2D/CollisionShape2D
@onready var Area = $Area2D

func _ready():
	sprite = itemScript.worldSprite
	onStart()



func onStart():
	
	pass
	

func interaction():
	
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
