class_name EnemyBehavior
extends CharacterBody3D

@export var enemy_health = 10
@onready var text = $AcceptDialog
@onready var enemy = $"."

func _ready():
	enemy.position = Vector3(-5, 2, 4)
		
func _process(delta):
	if (enemy_health > 0):
		text.set_text("enemy health: " + str(enemy_health))
	elif (enemy_health == 0):
		enemy.position = Vector3(50,50,50)
		text.set_text("enemy is dead")
		
