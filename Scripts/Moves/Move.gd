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
var animation : String
var move_name : String
var has_queued_move : bool = false
var queued_move : String = "error: no queued move"


var enter_state_time : float

# priority
static var moves_priority : Dictionary = {
	# break into different containers? does it matter?
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





var combat : PlayerCombat
# var animator : 


@export var tracking_angular_speed : float = 10


var initial_position : Vector3
var frame_length = 0.016


var has_forced_move : bool = false
var forced_move : String = "error: nonexistent forced move"

var DURATION : float
