extends Control

@onready var start_b = $VBoxContainer/VBoxContainer/start_button
@onready var quit_b = $VBoxContainer/VBoxContainer/quit_button
var next_scene_resource = preload("res://Scenes/MainWorld.tscn")


func _on_start_button_pressed():	
	get_tree().change_scene_to_packed(next_scene_resource)
	

func _on_quit_button_pressed():
	get_tree().quit()
