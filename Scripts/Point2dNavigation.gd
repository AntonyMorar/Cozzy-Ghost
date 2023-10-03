extends Node3D

@export var camera:Camera3D

func get_mouse_position_point():
	var mousePos = get_viewport().get_mouse_position()
	var rayLength = 100
	var from = camera.project_ray_origin(mousePos)
	var to = from + camera.project_ray_normal(mousePos) * rayLength
	var space = get_world_3d().direct_space_state
	var rayQuery = PhysicsRayQueryParameters3D.new()
	rayQuery.from = from
	rayQuery.to = to
	rayQuery.collide_with_areas = true
	var result = space.intersect_ray(rayQuery)
	if(!result.is_empty()):
		Events.emit_signal("clickedObjeto", result.collider.get_parent().name)
	
	return mousePos
	
	
