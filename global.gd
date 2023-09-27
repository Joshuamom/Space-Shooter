extends Node

var VP = Vector2.ZERO
var Score = 0
var Lives = 0
var time = 0
var Player = null

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	randomize()
	VP = get_viewport().size
	var _Sig = get_tree().get_root().size_changed.connect(_resize)
	reset()


func _process(_delta):
	if Input.is_action_just_pressed("menu"):
		var menu = get_node_or_null("/root/game/UI/pause_menu")
		if menu == null:
			get_tree().quit()
		else:
			if menu.visible:
				get_tree().paused = false
				menu.hide()
			else:
				get_tree().paused = true
				menu.show()
	var asteroid_container = get_node_or_null("/root/game/asteroid_container")
	var Enemy_Container = get_node_or_null("/root/game/Enemy_Container")
	if asteroid_container != null and Enemy_Container != null:
		if asteroid_container.get_child_count() == 0 and Enemy_Container.get_child_count() == 0:
			get_tree().change_scene_to_file("res://UI/end_game.tscn")
		
func Update_Lives(l):
	Lives += l
	var hud = get_node_or_null("/root/game/UI/HUD")
	if hud != null:
		hud.Update_Lives()
	if Lives < 0:
		get_tree().change_scene_to_file("res://UI/end_game.tscn")

		
	
func Update_Score(s):
	Score += s
	var hud = get_node_or_null("/root/game/UI/HUD")
	if hud != null:
		hud.Update_Score()
	
func Update_time(t):
	time += t
	
func _resize():
	VP = get_viewport().size
	var hud = get_node_or_null("/root/game/UI/HUD")
	if hud != null:
		hud.Update_Lives()

func reset():
	#get_tree().paused = false
	Score = 0
	Lives = 3
	time = 60
	#level = -1
	#for x in levels:
		#x ["asteroid_spawn"] = false
		#x ["enemy_spawn"] = false
	
