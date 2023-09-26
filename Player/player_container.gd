extends Node2D

var Player = load("res://Player/player.tscn")


func _physics_process(_delta):
	if get_child_count() == 0:
		var player = Player.instantiate()
		#player.position = Vector2(576,324)
		player.position = Vector2(Global.VP.x/2,Global.VP.y/2)
		add_child(player)

