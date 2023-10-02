extends Node

@export var lights :Array[SpotLight3D] = []
# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect('nightStarts', _turn_on)
	Events.connect('dayStarts', _turn_off)

func _turn_on():
	for light in lights:
		light.visible = true

func _turn_off():
	for light in lights:
		light.visible = false
