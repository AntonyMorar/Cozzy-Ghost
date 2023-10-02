extends Node3D

@export var camera:Camera3D
@export var navigationAgent:NavigationAgent3D

func get_rayposition():
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
	Events.emit_signal("clickedObjeto", result.collider.get_parent().name)
	return result.position
