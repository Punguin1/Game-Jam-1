extends KinematicBody2D


export var speed = 250
export var bullet_speed = 1000
export var fire_rate = 0.2


var bullet = preload("res://Scenes/Bullet.tscn")
var can_fire = true

onready var health = $Health	
		
func _process(delta):
	look_at(get_global_mouse_position())
	$Weapon.shooting_handler(rotation_degrees, rotation)
	
		
func _physics_process(delta: float):
	var direction = Vector2()
	if Input.is_action_pressed("move_up"):
		direction += Vector2(0, -1)
	if Input.is_action_pressed("move_down"):
		direction += Vector2(0, 1)
	if Input.is_action_pressed("move_left"):
		direction += Vector2(-1, 0)
	if Input.is_action_pressed("move_right"):
		direction += Vector2(1, 0)
	
	move_and_slide(direction.normalized() * speed)

