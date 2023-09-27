extends Control




func _on_player_pressed():
	Global.Player = load("res://Player/player.tscn")
	get_tree().change_scene_to_file("res://game.tscn")
	



func _on_ship_pressed():
	Global.Player = load("res://Player/ship.tscn")
	get_tree().change_scene_to_file("res://game.tscn")




func _on_ship_b_pressed():
	Global.Player = load("res://Player/shipB.tscn")
	get_tree().change_scene_to_file("res://game.tscn")
