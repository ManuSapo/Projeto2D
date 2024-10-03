extends Resource
class_name Skill

@export var Damage: int
@export var Name: String
@export var ManaCost: int
@export var Turns: int
@export var Description: String
@export var icon: Texture2D 

# Enum para definir o tipo de skill
enum SkillType { DAMAGE, HEALING, BUFF }

# Exporta o enum como uma propriedade editável no editor
@export var skill_type: SkillType = SkillType.DAMAGE
