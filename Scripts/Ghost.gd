extends CharacterBody3D

@export var speed = 5.0
@export var navigationAgent:NavigationAgent3D
@export var pointNavi:Node3D
@export var character:Node3D

enum estados{
	NORMAL,
	GRABBING,
	INFO,
	WRITING,
	CONV
}

var estadoActual = estados.NORMAL
var menu_active = false

func _ready():
	Events.connect("inConv", _set_in_conv)
	Events.connect("inMenu", _set_in_menu)

func _process(delta):
	if(navigationAgent.is_navigation_finished()):
		character.idle()
		return
	
	character.move()
	moveToPoint(delta, speed)

func moveToPoint(delta, speed):
	var targetPos = navigationAgent.get_next_path_position()
	var direction = global_position.direction_to(targetPos)
	faceDirection(targetPos)
	velocity = direction * speed
	move_and_slide()

func faceDirection(direction):
	look_at(Vector3(direction.x, global_position.y, direction.z), Vector3.UP)

func _input(event):
	if Input.is_action_just_pressed("LeftMouse") and estadoActual == estados.NORMAL:
		navigationAgent.target_position = pointNavi.get_rayposition()

func _set_in_conv(_in_conv, conv_name):
	if(_in_conv):
		estadoActual = estados.CONV
		menu_active = _in_conv
	else:
		estadoActual = estados.NORMAL
		menu_active = _in_conv

func _set_in_menu(_in_menu):
	if(_in_menu):
		estadoActual = estados.CONV
		menu_active = _in_menu
	else:
		estadoActual = estados.NORMAL
		menu_active = _in_menu
