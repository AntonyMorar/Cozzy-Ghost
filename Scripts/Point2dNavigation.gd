extends Node3D

@export var camera:Camera3D

func get_mouse_position_point():
	var mousePos = get_viewport().get_mouse_position()
#
	return mousePos
	
	
