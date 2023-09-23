extends Control

var Indicatior = load("res://UI/indicator.tscn")
var Lives_pos = Vector2(20,Global.VP.y - 20)
var Lives_inx = 30

func _ready():
	Update_Score()
	Update_Time()
	Update_Lives()

func Update_Score():
	$Score.text = "Score: " + str(Global.Score)

func Update_Time():
	$Time.text = "Time: " + str(Global.time)

func Update_Lives():
	Lives_pos = Vector2(20,Global.VP.y - 20)
	for child in $Indicator_Container.get_children():
		child.queue_free()
	for i in range(Global.Lives):
		var indicator = Indicatior.instantiate()
		indicator.position = Lives_pos + Vector2(Lives_inx*i,0)
		$Indicator_Container.add_child(indicator)

func _on_timer_timeout():
	Global.Update_time(-1)
	Update_Time()
	if Global.time <= 0:
		get_tree().change_scene_to_file("res://UI/end_game.tscn")
