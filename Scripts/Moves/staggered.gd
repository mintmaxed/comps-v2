extends Move

const ANIMATION_END = 0.8667

func _ready():
	animation = "Hit_A"

func default_lifecycle(input : InputPackage):
	if works_longer_than(ANIMATION_END):
		pass
		# return best_payable_input
	return "okay"
