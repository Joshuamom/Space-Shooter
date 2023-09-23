extends Control


func _ready():
	$Label.text = "Thank You For Playing : ) \n your score was: " + str(Global.Score) + " !"

func _on_play_pressed():
	Global.reset()
	get_tree().change_scene_to_file("res://game.tscn")


func _on_quit_pressed():
	get_tree().quit()
