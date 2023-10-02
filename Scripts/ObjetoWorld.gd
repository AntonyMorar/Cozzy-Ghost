extends Node3D

enum estadoObjeto{
	ENTRO,
	SALIO
}

@export var KappaModel:Resource
var modelo
var titulo
var temp = false

func _ready():
	
	if !temp:
		_setea_atributos()
	else:
		Events.connect("seteaTempAttributes", _setea_atributos)
		

func _setea_atributos():
	titulo = KappaModel.Titulo
	KappaModel.get_model(self, "Modelo")
	modelo = $Modelo

func _on_area_3d_body_entered(body):
	Events.emit_signal("entraPlayer", body, KappaModel, estadoObjeto.ENTRO)

func _on_area_3d_body_exited(body):
	Events.emit_signal("entraPlayer", body, KappaModel, estadoObjeto.SALIO)
