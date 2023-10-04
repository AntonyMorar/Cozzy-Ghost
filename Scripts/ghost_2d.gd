extends CharacterBody2D

@export var speed = 200.0
@export var pointNavi:Node3D
@onready var anim = $AnimationPlayer
@onready var ghost_sprite = $Sprite2D

enum estados{
	NORMAL,
	GRABBING,
	INFO,
	WRITING,
	CONV
}

var estadoActual = estados.NORMAL
var menu_active = false
var direction = Vector2(0,0)
var targetPos = Vector2(0,0)
var tween:Tween

func _ready():
	Events.connect("inConv", _set_in_conv)
	Events.connect("inMenu", _set_in_menu)
	anim.play("hover_ghost")
	

func _input(event):
	if Input.is_action_just_pressed("LeftMouse") and estadoActual == estados.NORMAL:
		targetPos = pointNavi.get_mouse_position_point()
		if(targetPos != null):
			if(position > targetPos):
				ghost_sprite.flip_h = false
			else:
				ghost_sprite.flip_h = true
				
			tween = get_tree().create_tween().set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_OUT)
			tween.tween_property(self, "position", targetPos, 2.0)
			tween = get_tree().create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
			tween.tween_property(self, "scale", Vector2(1.4,0.5), 0.1).from(Vector2(1,1))
			tween.tween_property(self, "scale", Vector2(1,1), 0.2).from(Vector2(1.4,0.5))


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
