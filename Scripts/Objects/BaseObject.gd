extends MeshInstance3D

var is_active = false

@export var autolock:bool = true

@export var animation:AnimationPlayer
@export var light:Light3D
@export var effect:GPUParticles3D

func _clicked():
	if is_active and autolock: return
	if autolock:
		is_active = true
	else:
		is_active = !is_active
	#Animation
	if animation: animation.play("Move")
	#Ligth
	if light: 
		if is_active:
			light.light_energy = 0
		else:
			light.light_energy = 3
	#VFX
	if effect:
		effect.emitting = true
		
func _active():
	is_active = false
