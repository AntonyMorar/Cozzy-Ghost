extends Node3D

@export var tiempo_vida:=5.0

func _ready():
	$AnimationPlayer.play("entra_aranita")
	$Area3D.input_ray_pickable = false

func _clicked():
	$Area3D.queue_free()
	Events.emit_signal('aranitaClickeada')
	$AnimationPlayer.play("hide_aranita")

func _entra_aranita():
	$Area3D.input_ray_pickable = true
	await get_tree().create_timer(tiempo_vida).timeout
	$AnimationPlayer.play("se_va_aranita")

func _se_va_aranita():
	$Area3D.input_ray_pickable = false


func _free_aranita():
	queue_free()
