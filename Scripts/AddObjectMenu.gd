extends Control

@export var KappaResourseNew:Resource
@onready var Files = $FileDialog

func _on_seleccionar_modelo_pressed():
	_remove_temp()
	Files.popup()	


func _on_file_dialog_dir_selected(dir):
	var directory = DirAccess.open(dir)
	var texturedir = DirAccess.open(dir)
	var textureFiles = texturedir.get_files()
	var files = directory.get_files()
	var objeto_gltf
	
	for file in textureFiles:
		if file.ends_with('.png') or file.ends_with('.jpg'):
			directory.copy(dir+"/"+file, "res://Assets/3D/temp_object/" + file)
	
	for file in files:
		if file.ends_with('.gltf'):			
			directory.copy(dir+"/"+file, "res://Assets/3D/temp_object/temp_kappa.gltf")
			KappaResourseNew.ModelPath = "res://Assets/3D/temp_object/temp_kappa.gltf"
			objeto_gltf = file.trim_suffix(".gltf")
		elif file.ends_with('.bin'):
			directory.copy(dir+"/"+file, "res://Assets/3D/temp_object/"+file)
		elif file.ends_with('.md'):
			directory.copy(dir+"/"+file, "res://Assets/3D/temp_object/temp_kappa.md")
	
	KappaResourseNew.Titulo = 'Nuevo Recurso'
	
	Files.hide()
	_crea_Kappa(objeto_gltf)
	
	
#	var cargof = DirAccess.
#	if cargof.file_exists("res://Assets/3D/temp_object/"+objeto_gltf):
#	Events.emit_signal("meteObjeto", objeto_gltf)
	
func _remove_temp():	
	if DirAccess.dir_exists_absolute("res://Assets/3D/temp_object/"):
		var directory = DirAccess.open("res://Assets/3D/temp_object/")
		var files = directory.get_files()
		for file in files:
			if file.ends_with('.tres'):
				pass
			else:
				DirAccess.remove_absolute("res://Assets/3D/temp_object/" + file)
		
#		if DirAccess.dir_exists_absolute("res://Assets/3D/temp_object/"):
#			var directoryt = DirAccess.open("res://Assets/3D/temp_object/")
#			var filest = directoryt.get_files()
#			for file in filest:
#				DirAccess.remove_absolute("res://Assets/3D/temp_object/" + file)
		
#		DirAccess.remove_absolute("res://Assets/3D/temp_object/texturas/")		
#		DirAccess.remove_absolute("res://Assets/3D/temp_object/")

func _crea_Kappa(_objeto):
#	KappaResourseNew.Titulo = 'Nuevo Recurso'
#
#	KappaResourseNew.ModelPath = "res://Assets/3D/temp_object/"+_objeto+".gltf"
#	KappaResourseNew.TextoPath = "res://Assets/3D/temp_object/"+_objeto+".md"
	
	Globals.TempKappaResourse = KappaResourseNew
	Events.emit_signal("meteObjeto", 'temp')
