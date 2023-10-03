extends Camera3D

@export var LERP_VAL:= 4.6
var distancia := 4.1
var distancia_y := 3.1

func _ready():
	position = Globals.positionCamera
	Events.connect("infoShowcase", _set_positionShowcase)

func _process(_delta):
	position.y = lerp(position.y, $"../CharacterBody3D".position.y + distancia_y, _delta*LERP_VAL)
	position.x = lerp(position.x, $"../CharacterBody3D".position.x, _delta*LERP_VAL)
	position.z = lerp(position.z, $"../CharacterBody3D".position.z - distancia, _delta*LERP_VAL)	
	
func _set_positionShowcase():
	Globals.positionCamera = position
