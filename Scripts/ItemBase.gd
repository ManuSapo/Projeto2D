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
	queue_free()

func item():
	pass
