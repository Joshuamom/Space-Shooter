extends CharacterBody2D

var speed = 10
var Max_s = 700
var rotate_s = 0.1
var nose = Vector2(0,-60)
var Bullet = load("res://Player/bullet.tscn")
var Bomb = load("res://Player/bomb.tscn")
var bullet_sound = null
var Effects = null
var Explosion = load("res://Effects/explosion.tscn")
var Health = 8

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
	position.x = wrapf(position.x, 0.0, Global.VP.x)
	position.y = wrapf(position.y, 0.0, Global.VP.y)
	move_and_slide()
	
	
	if Input.is_action_just_pressed("Shoot"):
		var bullet = Bullet.instantiate()
		bullet.position = position + nose.rotated(rotation)
		bullet.rotation = rotation
		var Effects = get_node_or_null("/root/game/Effects")
		if Effects != null:
			bullet_sound = get_node_or_null("/root/game/bullet")
			if bullet_sound != null:
				bullet_sound.play()
			Effects.add_child(bullet)
			
	if Input.is_action_just_pressed("bomb"):
		var bomb = Bomb.instantiate()
		bomb.position = position + nose.rotated(rotation)
		bomb.rotation = rotation
		var Effects = get_node_or_null("/root/game/Effects")
		if Effects != null:
			Effects.add_child(bomb)
			
func damage(d):
	Health -= d
	if Health <= 0:
		Effects = get_node_or_null("/root/game/Effects")
		if Effects != null:
			var explosion = Explosion.instantiate()
			Effects.add_child(explosion)
			explosion.global_position = global_position
			hide()
			await explosion.animation_finished
		Global.Update_Lives(-1)
		queue_free()
		


func _on_area_2d_body_entered(body):
	if body.name != "player":
		damage(100)

