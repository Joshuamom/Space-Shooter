extends Area2D
#hello
var speed = 15.0
var damage = 3.0
var velocity = Vector2.ZERO
var Effects = null
var Explosion = load("res://Effects/explosion.tscn")


func _ready():
	velocity = Vector2(0,-speed).rotated(rotation)



func _physics_process(_delta):
	position = position + velocity


func _on_body_entered(body):
	if body.has_method("damage"):
		body.damage(damage)
	Effects = get_node_or_null("/root/game/Effects")
	if Effects != null:
		var explosion = Explosion.instantiate()
		Effects.add_child(explosion)
		explosion.global_position = global_position
	queue_free()


func _on_timer_timeout():
	queue_free()
