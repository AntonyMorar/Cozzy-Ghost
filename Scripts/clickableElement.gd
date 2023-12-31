extends Node

#Private
var area3D:Area3D
var audiosStream:AudioStreamPlayer

func _ready():
	audiosStream = get_node("AudioStreamPlayer")
	area3D = get_parent().get_node("Area3D")
	area3D.connect('input_event', _clickeado)
	
func _clickeado(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			audiosStream.play()
			if get_parent().has_method("_clicked"):
				get_parent()._clicked()
			
