extends CharacterBody2D

var initial_s = 100.0
var Health = 10

func _ready():
	velocity = Vector2(0, initial_s*randf()).rotated(2*PI*randf())


func _physics_process(_delta):
	move_and_slide()
	position.x = wrapf(position.x,0,1152)
	position.y = wrapf(position.y,0,648)
	
	
func damage(d):
	Health -= d
	if Health <= 0:
		queue_free()
