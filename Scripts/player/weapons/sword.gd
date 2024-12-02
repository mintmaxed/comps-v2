class_name Sword
extends Weapon

func _ready():
	base_damage = 10
	basic_attacks = {
		"hit_1" : "hit_1"
	}
	
func get_hit_data():
	return holder.current_move.form_hit_data(self)
