extends Area2D

var velocity = Vector2(0, -7.5)
var damage = 5
var explosion = load("res://Effects/explosion.tscn")
var blast_radius = []

func _ready():
	velocity = velocity.rotated(rotation)
	
func _physics_process(_delta):
	
	position += velocity


func _on_body_entered(body):
	if body.name != "Player":
		for b in blast_radius:
			if b.has_method("damage"):
				b.damage(damage)
		var effects = get_node("/root/game/Effects")
		var Explosion = explosion.instantiate()
		Explosion.global_position = global_position
		Explosion.scale = Vector2(3.0,3.0)
		effects.add_child(Explosion)
			



func _on_blast_body_entered(body):
	if body.name != "player":
		if body not in blast_radius:
			blast_radius.append(body)
	



func _on_blast_body_exited(body):
	for b in range(blast_radius.size()):
		if body == blast_radius[b]:
			blast_radius.remove_at(b)
			break
		
