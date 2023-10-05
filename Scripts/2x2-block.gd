extends Node3D

var clickeado = false

func _clicked():
	if !clickeado:
		$AnimationPlayer.play("rotate_cube")
		clickeado = true
