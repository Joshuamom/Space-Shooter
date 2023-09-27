extends Control
var VP = Vector2.ZERO

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	randomize()
	VP = get_viewport().size
	var _Sig = get_tree().get_root().size_changed.connect(_resize)
	
	
func _physics_process(_delta):
	position.x = wrapf(position.x,0,Global.VP.x)
	position.y = wrapf(position.y,0,Global.VP.y)
	
func _resize():
	VP = get_viewport().size
