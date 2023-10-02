extends Node3D

enum estadoObjeto{
	ENTRO,
	SALIO
}

var modelo
var titulo
var temp = false
var grabbed = false


func _ready():
	if !temp:
		_setea_atributos()
	else:
		Events.connect("seteaTempAttributes", _setea_atributos)
		
	if grabbed:
		$StaticBody3D.free()
		$Area3D.free()
	else:
		$Area3D.body_entered.connect(_on_area_3d_body_entered)
		$Area3D.body_exited.connect(_on_area_3d_body_exited)

func _setea_atributos():
	titulo = $".".name


func _on_area_3d_body_entered(body):
	if !grabbed:
		Events.emit_signal("entraPlayer", body, titulo, estadoObjeto.ENTRO)
		
		if Globals.estadoPlayer == 0:
			Globals.ModelPath = NodePath($".".get_child(2).scene_file_path)
			Globals.ObjectPath = NodePath($".".scene_file_path)
			Globals.Titulo = titulo
			Globals.TextoPath = "res://Assets/3D/modsPCK/"+titulo+"/descripcion.md"
			Globals.scaleObject = scale
			Globals.rotateObject = rotation
		
		

func _on_area_3d_body_exited(body):
	if !grabbed:
		Events.emit_signal("entraPlayer", body, titulo, estadoObjeto.SALIO)
