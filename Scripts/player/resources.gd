class_name PlayerResources
extends Node

@export var health : float = 100
@export var max_health : float = 100

# TODO
# power-ups check
# cooldown? for sprint/dodge
# buff and debuff status

func lose_health(amount : float):
	health -= amount
	if health < 1:
		# model.current_move.try_force_move("death")
		pass
		
func gain_health(amount : float):
	if health + amount <= max_health:
		health += amount
	else:
		health = max_health
		

