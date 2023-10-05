extends Control

var is_paused = false

func _unhandled_input(event):
	if event.is_action_pressed("Escape"):
		if !is_paused:
			visible = true
			get_tree().paused = true
			is_paused = true
		else:
			visible = false
			get_tree().paused = false
			is_paused = false

func _on_resume_button_pressed():
	visible = false
	get_tree().paused = false
	is_paused = false

func _on_options_button_pressed():
	pass # Replace with function body.

func _on_quit_button_pressed():
	get_tree().quit()
