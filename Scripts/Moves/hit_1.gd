class_name hit_1
extends Move

const COMBO_TIMING = 0.5
const TRANSITION_TIMING = 1
var hit_damage = 10 # should be a function of player stats

func _ready():
	animation = "1H_Melee_Attack_Slice_Diagonal"
	move_name = "hit_1"
	
func check_relevance(input : InputPackage):
	if works_longer_than(COMBO_TIMING) and has_queued_move:
		has_queued_move = false
		return queued_move
	elif works_longer_than(TRANSITION_TIMING):
		input.actions.sort_custom(moves_priority_sort)
		return input.actions[0]
	else:
		return "okay"

func update(_input : InputPackage, delta : float):
	pass
	#player.move_and_slide()
	# move_player(delta)
	# player.model.active_weapon.is_attacking = right_weapon_hurts()

	
func move_player(delta : float):
	# var delta_pos = get_root_position_delta(delta)
	# delta_pos.y = 0
	#  player.velocity = player.get_quaternion() * delta_pos / delta

	player.move_and_slide()

# TODO: fix how this works! you can see what it's trying to do, won't work with our implementation though
#func form_hit_data(weapon : Weapon) -> HitData:
	#var hit = HitData.new()
	#hit.damage = hit_damage
	#hit.hit_move_animation = animation
	#hit.can_block = is_blockable()
	#hit.weapon = player.model.active_weapon
	#return hit

func on_enter_state():
	player.velocity = Vector3.ZERO
	
func on_exit_state():
	# player.model.active_weapon.hitbox_ignore_list.clear()
	# player.model.active_weapon.is_attacking = false
	pass
