extends Node2D

var Player = Global.Player


func _physics_process(_delta):
	if get_child_count() == 0 and Global.Player != null:
		var player = Global.Player.instantiate()
		#player.position = Vector2(576,324)
		player.position = Vector2(Global.VP.x/2,Global.VP.y/2)
		add_child(player)

