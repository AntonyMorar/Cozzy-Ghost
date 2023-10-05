extends Node3D

signal s_objectClicked(id)

var colldown = 0.1
var actualCooldown

func _ready():
	actualCooldown = colldown;

func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("Object pressed")
			emit_signal("s_objectClicked", 0)
