extends Resource
class_name StatusPlayer

#status
@export var health: int = 100
@export var max_health: int = 100
@export var mana: int = 50
@export var max_mana: int = 50
@export var attack: int = 10
@export var defense: int = 5
@export var speed: int = 10

#funções de combate
func take_damage(amount: int):
	print("taking damage")
	var damage
	damage = (amount + attack) - (defense * 0.66)
	round(damage)
	health -= damage
	if health < 0:
		health = 0
		print("player died")
		



func heal(amount: int):
	var healV
	healV = amount + (defense * 0.66)
	round(healV)
	health += healV
	
	if health > max_health:
		health = max_health

func spendMana(amount: int):
	mana -= amount
	if mana < 0:
		mana = 0


func regenMana(amount: int):
	mana += amount
	if mana > max_mana:
		mana = max_mana
