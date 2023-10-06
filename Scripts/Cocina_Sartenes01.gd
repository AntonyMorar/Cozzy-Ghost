extends MeshInstance3D

var is_active = false

func _clicked():
	if !is_active:
		is_active = true
		#Globals.ya_clickeo_sarten = true
		$AnimationPlayer.play("agitar_sartenes")
		
func _active_again():
	is_active = false
