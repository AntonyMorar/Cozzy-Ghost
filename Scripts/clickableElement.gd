extends Node

@export var click_area:Area3D

func _ready():
	click_area.connect('input_event', _clickeado)
	
func _clickeado(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			get_parent()._clicked()
