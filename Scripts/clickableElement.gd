extends Node

@export var click_area:Area3D

func _ready():
	Events.connect('clickedObjeto', _clickeado)
	
func _clickeado(_name):
	if(_name == get_parent().name):
		get_parent()._clicked()
