extends Node


@export var pathfollow3d:PathFollow3D
@export var movespeed = 1.0
@export var conv_name_carrier:NodePath
@export var player:CharacterBody3D
var name_carrier = ''
var stops = false
var in_conv = false

func _ready():
	Events.connect('inConv', _in_conv)
	name_carrier = pathfollow3d.get_node(conv_name_carrier).name

func _in_conv(_in_conv, conv_name):
	if(conv_name == name_carrier):
		in_conv = _in_conv 

func _stopper(_stops):
	stops = _stops

func _process(delta):
	if(!stops and !in_conv):
		pathfollow3d.progress += movespeed *delta
	elif(in_conv):
		pathfollow3d.look_at(player.global_transform.origin, Vector3.UP)


