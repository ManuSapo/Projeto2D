extends CharacterBody2D

var direction: Vector2
var canCollide: bool
var canMove: bool = true
@onready var timer = $Timer
@export var isRoaming: bool
@export var isFollowing: bool
@export var status: StatusEnemy = StatusEnemy.new()
@export var skills: SkillsEnemy = SkillsEnemy.new()
@export var speed = 15.0
@export var enemy_difficulty: enemyDifficulty = enemyDifficulty.easy
@onready var label = $Label


enum enemyDifficulty { easy, medium, hard, horde, boss, support }


signal EhealthChanged

func _ready():
	canMove = true
	isRoaming = true
	randomize()
	changeDirection()
	
@warning_ignore("unused_parameter")
func _process(delta):
	uiColor()
	if canMove:
		_movement(delta)
	
@warning_ignore("unused_parameter")
func _movement(delta):
	@warning_ignore("shadowed_variable_base_class")
	var velocity = direction * speed * delta
	var collision = move_and_collide(velocity)
	if  collision:
		if canCollide:
			changeDirection()
			speed = speed * 1.1
			canCollide = false
			timer.start()


func _fight():
	status.health = status.health - 5
	EhealthChanged.emit()
	pass
	
func changeDirection():
	var angle = randf() * PI * 2 #gera um angulo aleatorio entre 0 e 2*pi
	@warning_ignore("unused_variable")
	var Rangle = randf() * PI
	direction = Vector2(cos(angle), sin(angle)).normalized()


func _on_timer_timeout():
	canCollide = true

func changeMove():
	if canMove:
		canMove = false
		print("estado de movimento = ", canMove)
		return
		
	if !canMove:
		canMove = true
		print("estado de movimento = ", canMove)
		return

	
func uiColor():
	label.text = str(status.health)
	if status.Actual_Status == 0:
		modulate = Color(1, 1, 1, 1)
	elif status.Actual_Status == 1:
		modulate = Color(1, 0.73, 1, 1)
	elif status.Actual_Status == 2:
		modulate = Color(1, 0.43, 0.13, 1)
	elif status.Actual_Status == 3:
		modulate = Color(0, 0.83, 1, 1)



func _enemy():
	pass
