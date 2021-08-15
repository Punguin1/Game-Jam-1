extends RigidBody2D

var explosion = preload("res://Scenes/Explosion.tscn")

func _on_Bullet_body_entered(body):
	
	if body.has_method("handle_hit"):
		body.handle_hit()
	
		var explosion_instance = explosion.instance()
		explosion_instance.position = $ExplosionPosition.get_global_position()
		get_tree().get_root().add_child(explosion_instance)
		queue_free()
