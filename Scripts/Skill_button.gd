extends Button

@export var skill: Skill = Skill.new()

@onready var scrollBox = get_node("/root/Geral/Personagem/Camera2D/FightUI/LayoutUI/FightButtons/ScrollContainer")
@onready var textbox = $Panel
@onready var theText = $Panel/RichTextLabel

var canChange = true

func _ready() -> void:
	textbox.hide()
	set_skill()

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	set_skill()
	
	
func set_skill():
	icon = skill.icon
	if !icon:
		hide()
	else:
		show()
		theText.text = str(skill.Damage) + " damage"
	return

func biggerScroll():
	var new_sizeplus = scrollBox.custom_minimum_size
	new_sizeplus.x += 50
	scrollBox.set_custom_minimum_size(new_sizeplus)
	return

func tinyerScroll():
	var new_sizeminus = scrollBox.custom_minimum_size
	new_sizeminus.x -= 50
	scrollBox.set_custom_minimum_size(new_sizeminus)
	return

func _on_container_mouse_entered() -> void:
	biggerScroll()
	textbox.show()

func _on_container_mouse_exited() -> void:
	textbox.hide()
	tinyerScroll()
