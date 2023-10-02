extends Control


@export var timeline_name = ''
var parent_conv_name = ''
var in_range = false
var in_conv = false
var menu_active = false

func _ready():
	Dialogic.connect("timeline_ended", _dialogic_end_event)
	Events.connect("inMenu", _set_in_menu)
	Events.connect("clickedObjeto", _got_clicked)
	parent_conv_name = get_parent().name
	

func _init_dialog():
	Dialogic.start(timeline_name)
	

func _on_talk_radius_component_body_entered(body):
	in_range = true

func _on_talk_radius_component_body_exited(body):
	in_range = false

#func _input(event):
#	if event.is_action_pressed("Talk") and in_range and !in_conv and !menu_active:
#		_init_dialog()
#		in_conv = true
#		Events.emit_signal('inConv', in_conv, parent_conv_name)

func _got_clicked(object_name):
	if(object_name == parent_conv_name and in_range and !in_conv and !menu_active):
		_init_dialog()
		print('eee')
		in_conv = true
		Events.emit_signal('inConv', in_conv, parent_conv_name)

func _dialogic_end_event():
	in_conv = false
	Events.emit_signal('inConv', in_conv, parent_conv_name)

func _set_in_menu(_in_menu):
	menu_active = _in_menu
	



