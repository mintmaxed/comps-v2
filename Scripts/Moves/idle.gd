class_name Idle
extends Move

func _ready():
	animation = "Idle"

func default_lifecycle(input) -> String:
	if has_queued_move && resources.move_available(player.model.moves[queued_move]):
		has_queued_move = false
		return queued_move
	
	return best_eligible_input(input)
	
func on_enter_state():
	player.velocity = Vector3.ZERO

