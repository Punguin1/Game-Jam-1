extends Node2D

enum State{
	PATROL,
	ENGAGE
}

var current_state = State.PATROL setget set_state
var player: Player = null
var weapon: Weapon = null

#func set_weapon(weapon: Weapon):
#	self.Weapon = weapon

func _proces(delta: float) -> void:
	match current_state:
		State.PATROL:
			pass
		STATE.ENGAGE:
			if player != null and weapon != null:
				pass

func set_state(new_state: int):
	if new_state == current_state:
		return
	
	current_state = new_state
	emit_signal("state_changed", current_state)

	
func _on_PlayerDetector_body_entered(body):
	if body.is_in_group("player"):
		set_state(State.ENGAGE)
		body = player
	
