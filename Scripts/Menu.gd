extends Control

var conv_active = false
@onready var boton_container = $HBoxContainer/VBoxContainer
@onready var item_list = $HBoxContainer/ItemList
@onready var menu_block = $HBoxContainer/Menublock
var first_boton

func _ready():
	Events.connect("inConv", _set_in_conv)
	first_boton = boton_container.get_child(0)

func _input(event):
	if event.is_action_pressed("Menu") and !conv_active:
		visible = !visible
		if item_list.visible:
			item_list.visible = !item_list.visible
			menu_block.visible = !menu_block.visible
		first_boton.grab_focus()
		Events.emit_signal('inMenu', visible)
	if event.is_action_pressed("ui_cancel") and !conv_active:
		if !item_list.visible:
			visible = false
			Events.emit_signal('inMenu', visible)
		elif item_list.visible:
			item_list.visible = !item_list.visible
			menu_block.visible = !menu_block.visible
			first_boton.grab_focus()

func _set_in_conv(_in_conv, conv_name):
	if(_in_conv):
		conv_active = _in_conv
	else:
		conv_active = _in_conv

func _on_items_pressed():
	item_list.visible = !item_list.visible
	menu_block.visible = !menu_block.visible
	item_list.grab_focus()
	if !item_list.visible:
		first_boton.grab_focus()
