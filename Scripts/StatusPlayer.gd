extends Resource
class_name StatusPlayer

#status
@export var health: int = 100
@export var max_health: int = 100
@export var shield: int = 100
@export var mana: int = 50
@export var max_mana: int = 50
@export var attack: int = 10
@export var defense: int = 5
@export var speed: int = 10
@export var Actual_Status: actualStatus = actualStatus.empty

@export var temp_attack: int = 10
@export var temp_defense: int = 5
@export var temp_speed: int = 10


enum actualStatus { empty, poison, fire, shock, stun, bleed }

signal turnEnded

func process():
	pass

#funções de combate
func takeDamage(amount: int):
	print("taking damage")
	health -= amount
	if health < 0:
		health = 0
		print("player died")
		

func heal(amount: int):
	health += amount
	
	if health > max_health:
		health = max_health
		
func shielding(amount: int):
	shield += amount
	
	if shield > max_health:
		shield = max_health

func spendMana(amount: int):
	mana -= amount
	if mana < 0:
		mana = 0


func regenMana(amount: int):
	mana += amount
	if mana > max_mana:
		mana = max_mana

func statusDamages():
	if Actual_Status == 1:
		var poisonDamage
		poisonDamage = max_health * 0.2
		@warning_ignore("narrowing_conversion")
		temp_defense -= defense * 0.85
		print(temp_defense)
		print(poisonDamage)
		health -= poisonDamage
		if health < 0:
			health = 0
			print("player died")
	elif Actual_Status == 2:
		var fireDamage
		fireDamage = max_health * 0.05
		@warning_ignore("narrowing_conversion")
		temp_attack = attack * 0.85
		print(temp_attack)
		print(fireDamage)
		health -= fireDamage
		if health < 0:
			health = 0
			print("player died")
	elif Actual_Status == 3:
		var shockDamage
		shockDamage = max_health * 0.1
		@warning_ignore("narrowing_conversion")
		temp_speed = speed * 0.85
		print(temp_speed)
		print(shockDamage)
		health -= shockDamage
		if health < 0:
			health = 0
			print("player died")
	elif Actual_Status == 4:
		var beforeStun
		beforeStun = temp_attack
		temp_attack = 0
		await turnEnded
		temp_attack = beforeStun
		print(temp_speed)
	else:
		temp_attack = attack
		temp_defense = defense
		temp_speed = speed
		
