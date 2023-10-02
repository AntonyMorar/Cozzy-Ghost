extends Node3D

var modelo

func _ready():
	Events.connect("removeGrabObject", _removeGrabObject)
	Events.connect("positionGrabObject", _positionGrabObject)
	Events.connect("meteObjeto", _meteObjeto)	
	
func _removeGrabObject():	
	for _objeto in $Objetos.get_children():
		if _objeto.titulo == Globals.Titulo:
			_objeto.free()

func _positionGrabObject(_position, _rotation, _scale):
	var scene = load(Globals.ObjectPath)
	var instance = scene.instantiate()
	instance.set_name(Globals.Titulo)
	instance.set_script(preload("res://Scripts/Objeto3D_script.gd"))
	instance.get_child(0).get_child(0).get_child(0).visible = false
	instance.position = _position
	instance.scale = _scale
	instance.rotation = _rotation
	Globals.scaleObject = _scale
	Globals.rotateObject = _rotation
	
	$Objetos.add_child(instance)

func _meteObjeto(_object_name):
	var output = []
	OS.execute("CMD.exe", ["/C", 'mkdir '+ ProjectSettings.globalize_path("res://Assets/3D/modsPCK/"+_object_name).replace('/', "\\")], output)
	var scene = load("res://Assets/3D/modsPCK/"+_object_name+"/"+_object_name+".tscn")
	print(scene)
	var instance = scene.instantiate()
	instance.name = _object_name
	instance.set_script(preload("res://Scripts/Objeto3D_script.gd"))
	instance.get_child(0).get_child(0).get_child(0).visible = false
	instance.set_name(_object_name)
#
	$Objetos.add_child(instance)





func _on_enviar_boton_pressed():
	Events.emit_signal('sendText', $TextInput/TextEdit.text)
	$TextInput/TextEdit.text = ''
