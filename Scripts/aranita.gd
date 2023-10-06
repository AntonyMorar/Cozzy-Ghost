extends Node3D

func _clicked():
	Events.emit_signal('aranitaClickeada')
	$AnimationPlayer.play("hide_aranita")

func _free_aranita():
	queue_free()
