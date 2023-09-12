extends CharacterBody2D

var speed = 5
var Max_s = 400
var rotate_s = 0.2

func _physics_process(delta):
	if Input.is_action_pressed("Left"):
		rotation -= rotate_s
	if Input.is_action_pressed("Right"):
		rotation += rotate_s
	if Input.is_action_pressed("Forward"):
		velocity += Vector2(0,-speed).rotated(rotation)
		
	position.x = wrap(position.x, 0, 1152)
	position.y = wrap(position.y, 0, 648)
	velocity = velocity.normalized() * clamp(velocity.length(), 0, Max_s)
	move_and_slide()


