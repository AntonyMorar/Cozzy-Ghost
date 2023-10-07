extends Node3D

@export var tiempo_vida:=5.0
var lockeada = false

func _ready():
	$AnimationPlayer.play("entra_aranita")
	$Area3D.input_ray_pickable = false

func _clicked():
	lockeada = true
	$Area3D.input_ray_pickable = false
	Events.emit_signal('aranitaClickeada')
	$AnimationPlayer.play("hide_aranita")

func _entra_aranita():
	$Area3D.input_ray_pickable = true
	await get_tree().create_timer(tiempo_vida).timeout
	if !lockeada:
		$AnimationPlayer.play("se_va_aranita")

func _se_va_aranita():
	
	$Area3D.input_ray_pickable = false


func _free_aranita():
	queue_free()
