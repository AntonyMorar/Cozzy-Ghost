extends MeshInstance3D

var is_active = false
@export var animation:AnimationPlayer

func _clicked():
	if !is_active:
		is_active = true
		Globals.ya_clickeo_sarten = true
		animation.play("agitar_sartenes")
		
func _active_again():
	is_active = false
