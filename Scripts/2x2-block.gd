extends Node3D

var clickeado = false
var spookable = false

func _clicked():
	if !clickeado and Globals.ya_clickeo_sarten:
		$AnimationPlayer.play("rotate_cube")
		clickeado = true
		if spookable:
			print('ME ESPANTOOOOO')
			#puedes mandar true o false si el espanto es efectivo contra el
			Events.emit_signal('spookeado', true, 1.0)
