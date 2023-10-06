extends Node3D

@export var scary_messages:Array[MeshInstance3D]
@export var bored_messages:Array[MeshInstance3D]
var tween:Tween

func _ready():
	Events.connect('spookeado', _throw_message)
	

func _throw_message(_spookeado, _amount):
	if _spookeado:
		var selected_message = scary_messages.pick_random()
		var scale_amount = clamp(_amount, 0.0,1.0)+1
		var scale_message = Vector3(scale_amount, scale_amount, scale_amount)
		
		selected_message.visible = true
		tween = get_tree().create_tween().set_parallel(true)
		tween.tween_property(selected_message, "scale", scale_message, 0.5).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
		tween.tween_property(selected_message, "position", Vector3(0,1,0), 0.5).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
		tween.chain().tween_property(selected_message, "scale", Vector3(0,0,0), 0.5).from(scale_message).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
		tween.tween_property(selected_message, "position", Vector3(0,0,0), 0.5).from(Vector3(0,1,0)).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	else:
		var selected_message = bored_messages.pick_random()
		selected_message.visible = true
		tween = get_tree().create_tween().set_parallel(true)
		tween.tween_property(selected_message, "scale", Vector3(1,1,1), 0.9).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
		tween.tween_property(selected_message, "position", Vector3(0,0.5,0), 0.9).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
		tween.chain().tween_property(selected_message, "scale", Vector3(0,0,0), 0.9).from(Vector3(1,1,1)).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
		tween.tween_property(selected_message, "position", Vector3(0,-1,0), 0.9).from(Vector3(0,0.5,0)).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	

