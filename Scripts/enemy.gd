extends CharacterBody3D

@onready var behavior = $behavior
@onready var model = $Model as PlayerModel

func _ready():
	pass

func _physics_process(delta):
	var input = behavior.create_input(delta)
	model.update(input, delta)
	
	input.queue_free()
