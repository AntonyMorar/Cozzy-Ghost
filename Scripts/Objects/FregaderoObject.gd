extends MeshInstance3D

var is_active = false
@export var waterParticles:GPUParticles3D

func _clicked():
	if !is_active:
		is_active = true
		$AnimationPlayer.play("Move")
		waterParticles.emitting = true
		
func _active_again():
	is_active = false
