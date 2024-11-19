class_name Run
extends Move

@export var SPEED = 6.0
@export var TURN_SPEED = 3.0

@export var FRICTION = 0.5 # would need to implement momentum
@export var REBOUND = 0.2 # ?? maybe??	

func _ready():
	animation = "Running_A"

func check_relevance(input : InputPackage):
	input.actions.sort_custom(moves_priority_sort)
	if input.actions[0] == "run":
		return "okay"
	return input.actions[0]
	
func update(input : InputPackage, delta : float):
	process_input_vector(input, delta)
	player.move_and_slide()
	
func process_input_vector(input : InputPackage, delta : float):
	var input_direction = Vector3(input.input_direction.x, 0, input.input_direction.y).normalized()
	var face_direction = player.basis.z
	var angle = face_direction.signed_angle_to(input_direction, Vector3.UP)
	if abs(angle) >= tracking_angular_speed * delta:
		player.velocity = face_direction.rotated(Vector3.UP, sign(angle) * tracking_angular_speed * delta) * TURN_SPEED
		player.rotate_y(sign(angle) * tracking_angular_speed * delta)
	else:
		player.velocity = face_direction.rotated(Vector3.UP, angle) * SPEED
		player.rotate_y(angle)
	# animator.set_speed_scale(player.velocity.length() / SPEED)
	
func on_exit_state():
	# animator.set_speed_scale(1)
	pass
	
