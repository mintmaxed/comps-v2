class_name PlayerModel
extends Node

@onready var player = $".."
@onready var animator = $"../Knight/AnimationPlayer"
# TODO: abstract the animator somehow

var current_move : Move 

@onready var active_weapon : Weapon # = $weapon? as Sword

@onready var moves = {
	"idle" : $idle,
	"run" : $run,
	"hit_1" : $combat/hit_1,
	"hit_2" : $combat/hit_2,
	"block" : $combat/block,
	# "staggered" : 
	# "death" : 
	# parried?
}

func _ready():
	current_move = moves["idle"]
	for move in moves.values():
		move.player = player

func update(input : InputPackage, delta : float):
	var relevance = current_move.check_relevance(input)
		# later on check_relevance will need to be updated to account for the resource layer
	if relevance != "okay":
		switch_to(relevance)
	current_move.update(input, delta)
	animator.play(current_move.animation)
	
func switch_to(state : String):
	current_move.on_exit_state()
	current_move = moves[state]
	current_move.mark_enter_state()
	current_move.on_enter_state()



