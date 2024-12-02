extends Area3D

@onready var model = $".." as PlayerModel

# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(on_contact)
	
func on_contact(area):
	print("hitbox senses something")
	
	if is_eligible_attack(area):
		area.hitbox_ignore_list.append(self)
		model.current_move.react_on_hit(area.get_hit_data())
		print("eligible attack")

func is_eligible_attack(area : Node3D) -> bool:
	if (area == Weapon) && (area != model.active_weapon) && (area.hitbox_ignore_list.has(self)) && (area.is_attacking):
		return true
	
	return false
