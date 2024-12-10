class_name PlayerModel
extends Node

@export var is_enemy : bool = false


@onready var player = $".."
@onready var animator = $"AnimationPlayer"

var current_move : Move 
var active_weapon : Weapon

@onready var weapons = {
	# see if this works
	"sword" = $"../Knight/Rig/Skeleton3D/1H_Sword/sword" as Sword,
	"axe" = $"../Barbarian/Rig/Skeleton3D/1H_Axe/axe" as Axe
}

@onready var moves = {
	"idle" : $idle,
	"run" : $run,
	"hit_1" : $combat/hit_1,
	"hit_2" : $combat/hit_2,
	"block" : $combat/block,
	"staggered" : $staggered,
	"death" : $death,
	# parried?
}

func _ready():
	if(is_enemy):
		active_weapon = weapons["axe"]
	else:
		active_weapon = weapons["sword"]
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



