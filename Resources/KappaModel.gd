extends Resource
class_name KappaModel

@export var Titulo:= 'Titulo'
@export_global_file("*.gltf") var ModelPath = ''
@export_file("*.md") var TextoPath = ''


var scaleModelo := Vector3(1,1,1)
var rotateModelo := Vector3(0,0,0)
var scene

func get_text()->String:
	var workfile = FileAccess.open(TextoPath, FileAccess.READ)
	var content = workfile.get_as_text()
	workfile.close()
	return content

func get_model(_parent, _name)->void:
#	print(ModelPath)
	scene = ResourceLoader.load(ModelPath)
	
#	if scene == null:
#		sce.reload()
#		scene = ResourceLoader.load(ModelPath)
	
#	while scene == null:
#		scene.reload()
#		print('espero')
#		await _parent.get_tree().create_timer(1).timeout
#
#	print(scene)
	var instance = scene.instantiate()
	instance.set_name(_name)
	
	for _meshInstances in instance.get_children():
		_meshInstances.mesh.resource_local_to_scene = true

	_parent.add_child(instance)

func reload_model():
	scene = ResourceLoader.load(ModelPath)
#	scene.reload()
	pass
