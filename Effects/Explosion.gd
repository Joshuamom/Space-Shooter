extends AnimatedSprite2D

func _ready():
	play("default")
	var explosion = get_node_or_null("/root/game/explode")
	if explosion != null:
		explosion.play()


func _on_animation_finished():
	queue_free()
