extends Resource
class_name Skill

@export var Damage: int
@export var Name: String
@export var ManaCost: int
@export var Turns: int
@export var Description: String
@export var icon: Texture2D 
@export var skill_type: SkillType = SkillType.DAMAGE
@export var status_type: StatusType = StatusType.empty
@export var damage_type: DamageType = DamageType.empty
@export var damage_element: DamageElement = DamageElement.empty
@export var heal_type: HealType = HealType.empty
@export var buff_type: BuffType = BuffType.empty

enum SkillType { DAMAGE, HEALING, BUFF }
enum StatusType { empty, poison, fire, shock, stun, bleed }
enum DamageType { empty, meele, distance }
enum DamageElement { empty, elemental, normal, bullet, laser }
enum HealType { empty, heal, shield, mana }
enum BuffType { empty, attack, speed, defense }
