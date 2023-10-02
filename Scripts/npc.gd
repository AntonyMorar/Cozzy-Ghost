extends CharacterBody3D

# custom code for NPC

@export var character:Node3D
@export var pathcomponent:Node
var is_night = false

func _ready():
	Events.connect('inConv', _set_in_conv)
	Events.connect('nightStarts', _night)
	Events.connect('dayStarts', _day)
	character.move()

func _set_in_conv(_in_conv, conv_name):
	if((_in_conv and conv_name == name) or is_night):
		character.idle()
	else:
		character.move()

func _night():
	is_night = true
	character.idle()
	pathcomponent._stopper(true)

func _day():
	is_night = false
	character.move()
	pathcomponent._stopper(false)
