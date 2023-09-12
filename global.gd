extends Node


func _process(delta):
	if Input.is_action_pressed("menu"):
		get_tree().quit()
