extends CharacterBody2D

var Bullet = load("res://Enemy/enemy_bullet.tscn")
var Health = 10
var x_position = [990, 1121, 200, 600]
var y_positions = [100,120,200,500,560]
var initial_position = Vector2.ZERO
var direction = Vector2(1.5, 0)
var wobble = 35.0


func _ready():
	initial_position.x = -100
	initial_position.y = y_positions[randi() % y_positions.size()]
	position = initial_position
	
func _physics_process(_delta):
	position.x = wrapf(position.x,0,Global.VP.x)
	position.y = wrapf(position.y,0,Global.VP.y)
	position += direction
	position.y = initial_position.y+sin(position.x/20)*wobble
	if position.x > 1200:
		queue_free()

func _on_timer_timeout():
	var player = get_node_or_null("/root/game/player_container/player")
	var Effects = get_node_or_null("/root/game/Effects")
	if player != null and Effects != null:
		var enemy_sound = get_node_or_null("/root/game/alien")
		if enemy_sound != null:
			enemy_sound.play()
		var bullet = Bullet.instantiate()
		var d = global_position.angle_to_point(player.global_position) + PI/2
		bullet.rotation = d
		bullet.global_position = global_position + Vector2(0, -40).rotated(d)
		Effects.add_child(bullet)
		
func damage(d):
	Health -= d
	if Health <= 0:
		Global.Update_Score(600)
		queue_free()

func _on_area_2d_body_entered(body):
	if body.name == "player":
		damage(100)
		body.damage(100)
