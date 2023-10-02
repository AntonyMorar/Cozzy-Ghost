extends Node3D

@export var TalkRadius:= Area3D
@export var TextVoice:= Control

func _on_talk_radius_component_body_entered(body):
	TextVoice.init_dialog()
