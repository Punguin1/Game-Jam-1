extends Node2D
class_name Weapon

export var speed = 250
export var bullet_speed = 1000
export var fire_rate = 0.2

var can_fire = true
var bullet = preload("res://Scenes/Bullet.tscn")

func shooting_handler(deg_rotation, rad_rotation):
	if Input.is_action_pressed("fire") and can_fire:
		var bullet_instance = bullet.instance()
		bullet_instance.position = $BulletPoint.get_global_position()
		bullet_instance.rotation_degrees = deg_rotation
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rad_rotation))
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(fire_rate), "timeout")
		can_fire = true
