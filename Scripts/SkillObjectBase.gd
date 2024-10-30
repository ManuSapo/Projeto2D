extends Resource
class_name Skill

@export var Damage: int
@export var Name: String
@export var ManaCost: int
@export var Turns: int
@export var Description: String
@export var icon: Texture2D 
@export var skill_type: SkillType = SkillType.DAMAGE
@export var status_type: StatusType = StatusType.poison
@export var damage_type: DamageType = DamageType.meele
@export var damage_element: DamageElement = DamageElement.elemental

enum SkillType { DAMAGE, HEALING, BUFF }
enum StatusType { poison, fire, shock, stun, bleed }
enum DamageType { meele, distance }
enum DamageElement { elemental, normal, bullet, laser }
