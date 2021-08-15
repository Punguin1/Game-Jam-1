extends KinematicBody2D

func _ready() -> void:
	#$AI.set_weapon($Weapon)
	pass

func handle_hit():
	$Health.health -= 20
	print("enemy hit ", $Health.health)
	if $Health.health == 0:
		queue_free()
