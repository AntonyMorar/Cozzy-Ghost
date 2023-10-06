extends Node

func _spawn_item(_position3d,_rotation3d, _packed_scene):
	var item = _packed_scene.instantiate()
	item.position = _position3d
	item.rotation = _rotation3d
	add_child(item)
	
