extends Node3D

# custom code for generic_object

func _ready():
	Dialogic.connect("signal_event", _dialogic_signal_event)

func _dialogic_signal_event(param):
	print('param ', param)
