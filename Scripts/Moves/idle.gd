class_name Idle
extends Move

func _ready():
	animation = "Idle"

func check_relevance(input : InputPackage) -> String:
	input.actions.sort_custom(moves_priority_sort)
	return input.actions[0]	
	
func on_enter_state():
	player.velocity = Vector3.ZERO

