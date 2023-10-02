extends SpringArm3D

@export var mouse_sensitivity := 0.05
@export var LERP_VAL:= 4.6
@onready var character = $".."
var distancia := 4.1
var distancia_y := 0.775
var free_mouse = true

func _ready():
	set_as_top_level(true)
	position = Globals.positionCamera
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event is InputEventMouseMotion && free_mouse:
		pass
#		rotation_degrees.x -= event.relative.y * mouse_sensitivity
#		rotation_degrees.x = clamp(rotation_degrees.x, -65.0, -0.0)
#
#		rotation_degrees.y -= event.relative.x * mouse_sensitivity


func _process(_delta):	
	position.y = lerp(position.y, character.position.y + distancia_y, _delta*LERP_VAL)
	position.x = lerp(position.x, character.position.x, _delta*LERP_VAL)
	position.z = lerp(position.z, character.position.z, _delta*LERP_VAL)	

func _input(event):
	if event.is_action_pressed("menu_mouse"):		
		free_mouse = !free_mouse
	
	if free_mouse:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
