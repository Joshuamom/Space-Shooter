extends CharacterBody2D

var speed = 5
var Max_s = 400
var rotate_s = 0.08
var nose = Vector2(0,-60)
var Bullet = load("res://Player/bullet.tscn")

func get_input():
	var to_return = Vector2.ZERO
	$Exhaust.hide()
	if Input.is_action_pressed("Forward"):
		to_return += Vector2(0,-1)
		$Exhaust.show()
	if Input.is_action_pressed("Left"):
		rotation -= rotate_s
	if Input.is_action_pressed("Right"):
		rotation += rotate_s
	return to_return.rotated(rotation) 

func _physics_process(_delta):
	velocity += get_input()*speed
	velocity = velocity.normalized() * clamp(velocity.length(), 0, Max_s)
	position.x = wrapf(position.x, 0.0, 1152.0)
	position.y = wrapf(position.y, 0.0, 648.0)
	move_and_slide()
	
	if Input.is_action_just_pressed("Shoot"):
		var bullet = Bullet.instantiate()
		bullet.position = position + nose.rotated(rotation)
		bullet.rotation = rotation
		
		var Effects = get_node_or_null("/root/game/Effects")
		if Effects != null:
			Effects.add_child(bullet)



