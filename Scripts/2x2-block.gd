extends Node3D

var clickeado = false

func _clicked():
	if !clickeado and Globals.ya_clickeo_sarten:
		$AnimationPlayer.play("rotate_cube")
		clickeado = true
