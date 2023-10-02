extends Control
@export var LIMIT = 45
@onready var _text_edit = $TextEdit

var current_text = ''
var caret_line = 0
var caret_column = 0

func _input(event):
	if event.is_action_pressed("menu_mouse"):		
		visible = !visible

func _on_text_edit_text_changed():
	var new_text : String = _text_edit.text
	if new_text.length() > LIMIT:
		_text_edit.text = current_text
		_text_edit.set_caret_line(caret_line)
		_text_edit.set_caret_column(caret_column)
				
		
	current_text = _text_edit.text
	caret_line = _text_edit.get_caret_line()
	caret_column = _text_edit.get_caret_column()
	
