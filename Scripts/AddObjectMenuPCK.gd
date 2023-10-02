extends Control

@onready var Files = $FileDialog

func _on_seleccionar_modelo_pressed():		
	Files.popup()	
	

func _on_file_dialog_file_selected(path):
	var success = ProjectSettings.load_resource_pack(path)
	var object_name = path.get_file().trim_suffix(".pck")
	if success:
		Events.emit_signal("meteObjeto", object_name)
