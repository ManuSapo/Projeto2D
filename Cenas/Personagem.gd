extends CharacterBody2D

var canMove: bool
var direction: String = "down"

@export var isMoving: bool = false
@export var isRunning: bool = false
@export var status: StatusPlayer = StatusPlayer.new()
@export var skills: SkillsPlayer = SkillsPlayer.new()

@onready var camera = $Camera2D
@onready var enemy = get_node("/root/Geral/Enemies/FlyingDemon")
@onready var healthLabel = get_node("Camera2D/Label")
@onready var collider = $Detection/CollisionShape2D
@onready var overworldBars = $Camera2D/OverworldBars
@onready var fightBars = $Camera2D/FightUI/FightBars
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var fightUI = $Camera2D/FightUI
@onready var dummy = $DummyCharacter
@onready var buttons = $Camera2D/FightUI/LayoutUI/FightButtons
@onready var Fight = $Fight

signal healthChanged
signal manaChanged
@warning_ignore("unused_signal")
signal enemyContact(collider_scene)
signal fightCalled
signal stopEverything
signal moveEverything


func _ready():
	canMove = true
	overworldBars.show()
	fightUI.hide()
	dummy.hide()

func _process(delta):
	_sideThings()
	_animation()
	if canMove:
		_movement(delta)
		_running()

func _sideThings():
	var healthtext
	healthtext = status.get("health")
	healthLabel.text = str(healthtext)
	if status.speed > 50:
		isRunning = true
	else:
		isRunning = false
		
	_damageMe()
	_healMe()


#lida com a movimentação básica
func _movement(delta):
	@warning_ignore("shadowed_variable_base_class")
	var velocity = Vector2()
	@warning_ignore("unused_variable")

# Movimento horizontal
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		direction = "right"
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		direction = "left"
		
	# Movimento vertical
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		direction = "down"
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		direction = "up"
		
	# Normaliza o vetor de velocidade para garantir velocidade constante
	if velocity.length() > 0:
		velocity = velocity.normalized() * status.speed * delta
	if velocity.length() > 0:
		isMoving = true
	else:
		isMoving = false

	# Move o personagem
	move_and_collide(velocity)

#lida com a corrida
func _running():
	if Input.is_action_pressed("run"):
		status.speed = 100
	if Input.is_action_just_released("run"):
		status.speed = 50

#lida com as animações
func _animation():
	
	if !isMoving:
		match direction:
			"up":
				animated_sprite.play("Idle-Back")
			"down":
				animated_sprite.play("Idle-Front")
			"right":
				animated_sprite.play("Idle-Right")
			"left":
				animated_sprite.play("Idle-Left")
	else:
		match direction:
			"up":
				animated_sprite.play("Walking-Back")
			"down":
				animated_sprite.play("Walking-Front")
			"right":
				animated_sprite.play("Walking-Right")
			"left":
				animated_sprite.play("Walking-Left")

func _damageMe():
	if Input.is_action_just_pressed("interact"):
		healthChanged.emit()
		status.takeDamage(5)
		status.spendMana(2)
		manaChanged.emit()

func _healMe():
	if Input.is_action_just_pressed("heal"):
		healthChanged.emit()
		status.heal(5)
		manaChanged.emit()
		status.regenMana(4)

func _enemyFight():
	if canMove:
		fightCalled.emit(true)
		overworldBars.hide()
		fightUI.show()
		stopEverything.emit()
		canMove = false
		return
	else:
		fightCalled.emit(false)
		fightUI.hide()
		overworldBars.show()
		moveEverything.emit()
		canMove = true
		return
	
func sillyTest():
	pass
 
func startTurn():
	buttons.show()
	print("aperta o botão")
	
func endTurn():
	buttons.hide()
	print("turno acabou")


func _on_detection_body_entered(body):
	if body.has_method("_enemy"):
		_enemyFight()
		GameManager.Enemy(body)
		Fight.enemyStatus(body)
