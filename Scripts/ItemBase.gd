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
	


func item():
	pass


@warning_ignore("unused_parameter")
func _on_area_2d_body_entered(body: Node2D) -> void:
	collect(GameManager.player.inventory)

func collect(inventory: Inventory):
	inventory.insert(itemScript)
	queue_free()
