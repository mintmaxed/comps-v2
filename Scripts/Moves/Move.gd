class_name Move
extends Node

# TODO
# thinking of having three mini containers for mvt, combat, force moves
# this will be the basic template that all of those individual moves extend
# the containers themselves should maybe be filtered into the actual player class?

# universal
var player : CharacterBody3D
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


# fields to redefine
@export var animation : String
@export var backend_animation : String
@export var tracking_angular_speed : float = 10

var move_name : String
var has_queued_move : bool = false
var queued_move : String = "error: no queued move"

var has_override_move : bool = false
var override_move : String = "error: no move override"

var enter_state_time : float
var frame_length = 0.016

# priority
static var moves_priority : Dictionary = {
	# higher number = higher priority when deciding which input to use
	"idle" : 1,
	"run" : 2,
	"hit_2" : 3,
	"hit_1" : 4,
	"block" : 5,
	"sprint" : 6,
	"stagger" : 7,
	"death" : 8
}

static func moves_priority_sort(a : String, b : String):
	if moves_priority[a] > moves_priority[b]:
		return true
	else:
		return false

func update(input : InputPackage, delta : float):
	pass
	
func check_relevance(input : InputPackage) -> String:
	print_debug("error, implement check_relevance")
	return "error, implement check_relevance"
	
func best_eligible_input(input : InputPackage) -> String:
	input.actions.sort_custom(moves_priority_sort)
	return "what"
	
func react_on_hit(hit : HitData):
	# if (is_vulnerable()):
		# resources.lose_health(hit.damage)
	pass
	
	
func try_move_override(new_move_override : String):
	if (!has_override_move):
		has_override_move = true
		override_move = new_move_override
	elif (moves_priority[new_move_override] >= moves_priority[override_move]):
		override_move = new_move_override
		
#func is_vulnerable() -> bool:
	#return moves_data_repo.get_vulnerable(backend_animation, get_progress())
#
#func is_interruptable() -> bool:
	#return moves_data_repo.get_interruptable(backend_animation, get_progress())
#
#func is_parryable() -> bool:
	#return moves_data_repo.get_parryable(backend_animation, get_progress())

func on_enter_state():
	pass
	
func on_exit_state():
	pass
	
func mark_enter_state():
	enter_state_time = Time.get_unix_time_from_system()

func get_progress() -> float:
	var now = Time.get_unix_time_from_system()
	return now - enter_state_time    	    	   
		
func works_longer_than(time : float) -> bool:
	if get_progress() >= time:
		return true
	return false

func works_less_than(time : float) -> bool:
	if get_progress() < time: 
		return true
	return false
	
func works_between(start : float, end : float) -> bool:
	var progress = get_progress()
	if (progress >= start) && (progress <= end):
		return true
	return false
