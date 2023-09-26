extends Node

var VP = Vector2.ZERO
var Score = 0
var Lives = 0
var time = 0
var level = -1

var levels = [
	{
		"title" : "level 1 ",
		"subtitle" : "detroy all the astroids!! OvO",
		"asteroids" :[Vector2(100,100),Vector2(900,499)],
		"enemies": [],
		"timer": 100,
		"asteroid_spawn": false,
		"enemy_spawn": false
	},
	{
		"title" : "level 2 ",
		"subtitle" : "detroy all the astroids!! and a few friends",
		"asteroids" :[Vector2(900,105),Vector2(900,499), Vector2(800,800)],
		"enemies": [Vector2(160,250),Vector2(700,160)],
		"timer": 80,
		"asteroid_spawn": false,
		"enemy_spawn": false
	},
	{
		"title" : "level 3 ",
		"subtitle" : "you know the drill!",
		"asteroids" :[Vector2(700,105),Vector2(600,450), Vector2(750,800)],
		"enemies": [Vector2(160,250)],
		"timer": 80,
		"asteroid_spawn": false,
		"enemy_spawn": false
	}
	
	
	
]

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

func new_level():
	level += 1
	if level > levels.size():
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
	get_tree().paused = false
	Score = 0
	Lives = 5
	time = 60
	level = -1
	for x in levels:
		x ["asteroid_spawn" = false]
		x ["enemy_spawn" = false]
