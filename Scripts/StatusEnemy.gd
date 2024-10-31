extends Resource
class_name StatusEnemy

@export var enemyLevel: int = 1
@export var enemyType: String
@export var health: int = 100
@export var max_health: int = 100
@export var mana: int = 50
@export var max_mana: int = 50
@export var attack: int = 10
@export var defense: int = 5
@export var speed: int = 10
@export var theActualStatus: actualStatus = actualStatus.empty

@export var temp_attack: int = 10
@export var temp_defense: int = 5
@export var temp_speed: int = 10

enum actualStatus { empty, poison, fire, shock, stun, bleed }


signal turnEnded

func takeDamage(amount: int):
	health -= amount
	if health < 0:
		health = 0
		print("enemy died")




func heal(amount: int):
	health += amount
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


func poison():
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
		
func fire():
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
		
func shock():
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

func stun():
	var beforeStun
	beforeStun = temp_attack
	temp_attack = 0
	await turnEnded
	temp_attack = beforeStun
	print(temp_speed)
