extends Node2D

@export var itemScript: Inventory_Item = Inventory_Item.new()

@onready var sprite = $Control/TextureRect
@onready var Collision = $Area2D/CollisionShape2D
@onready var Area = $Area2D
@onready var player = GameManager.player

func _ready():
	onStart()


func onStart(): 
	pass
	

func interaction():
	print("aboboda")
	queue_free()

func item():
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.name)
	queue_free()
	pass # Replace with function body.
