extends CharacterBody3D

@export  var speed := 2.0
@export var gravity := 300.0
@export var LERP_VAL := 0.20
@export var ghostMat:StandardMaterial3D

@export var particles_preload:GPUParticles3D
@export var cam:Camera3D

@export var character:Node3D
var modeloTiny
var modeloGhost
var scene


enum estados{
	NORMAL,
	GRABBING,
	INFO,
	WRITING,
	CONV
}

var estadoActual = estados.NORMAL
var posicionGhost = Vector3(0.7, 0, 0.7)
var menu_active = false

@onready var posicionHandG = $GobotSkin/gobot/Armature/Skeleton3D/BoneAttachment3D
@onready var _spring_arm = %SpringArm3D
@export var multiplayer_testing = false
var move_direction := Vector3.ZERO
var tangent_rotation = 0.0

enum anim_state{
	MOVE,
	IDLE
}

var anim_current_state = anim_state.IDLE

var eDelta = 0

func _enter_tree():
	if(multiplayer_testing):
		var idname = name.to_int()
		set_multiplayer_authority(idname)
		cam.current = is_multiplayer_authority()
	
func _ready():
	Events.connect("inConv", _set_in_conv)
	Events.connect("inMenu", _set_in_menu)
	
	
func _input(event):
	if event.is_action_pressed("menu_mouse"):
		menu_active = !menu_active
		
	if menu_active:
		estadoActual = estados.WRITING
	else:
		estadoActual = estados.NORMAL
	


func _physics_process(_delta):
	
	if(estadoActual == estados.INFO || estadoActual == estados.WRITING || estadoActual == estados.CONV):
		character.idle()
		anim_current_state = anim_state.IDLE
		particles_preload.emitting = false
		pass
	else:
		move_direction.y = -1.5
		move_direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		move_direction.z = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		move_direction = move_direction.rotated(Vector3.UP, _spring_arm.rotation.y).normalized()
		
		velocity.x = lerp(velocity.x, move_direction.x * speed, LERP_VAL)
		velocity.z = lerp(velocity.z, move_direction.z * speed, LERP_VAL)
		velocity.y = lerp(velocity.y, move_direction.y * speed, LERP_VAL)
#		
		tangent_rotation = atan2(velocity.x, velocity.z)
		
		if(tangent_rotation != 0):
			character.rotation.y = lerp_angle(character.rotation.y, tangent_rotation , LERP_VAL)
		
		character.set_move_speed(velocity.length() / speed)		
	
		if(velocity.length() / speed > 0.5 && velocity.y > -1):
			character.move()
			anim_current_state = anim_state.MOVE
			particles_preload.emitting = true
		else:
			character.idle()
			anim_current_state = anim_state.IDLE
			particles_preload.emitting = false
		
		Globals.posicionPlayer = character.global_transform.origin
		move_and_slide()



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
