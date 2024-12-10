extends Node

@export var mode : String = "idle"

const hits_period : float = 2
var hits_threshold : float = 0

func create_input(delta) -> InputPackage:
	var new_enemy_input = InputPackage.new()
	new_enemy_input.actions.append("idle")
	
	#hits_threshold += delta
	#if hits_threshold >= hits_period:
		#new_enemy_input.actions.append("hit_1")
		#hits_threshold -= hits_period
	
	return new_enemy_input
