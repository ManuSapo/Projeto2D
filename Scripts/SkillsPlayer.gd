extends Resource
class_name SkillsPlayer

@export var skills: Array[Skill] = []

@warning_ignore("shadowed_variable")
func add_skill(skill: Skill):
	if skills.size() < 10:
		if skill is Skill:
			skills.append(skill)
		else:
			print("Invalid Type")
	else:
		print("You Cant Learn a New Skill")
