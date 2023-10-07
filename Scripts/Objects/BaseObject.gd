extends MeshInstance3D

@export_group("Parametros")
@export var autolock:bool = true #True if use cooldown to unlock
@export var cooldown: float = 0.15

@export_group("Acciones")
@export var animation:AnimationPlayer
@export var light:Light3D
@export var effect:GPUParticles3D

var is_active = false
var actualCooldown;
var spookable = false

func _ready():
	actualCooldown = cooldown

func _process(_delta):
	if is_active and autolock:
		actualCooldown -= _delta
		if(actualCooldown <= 0):
			is_active = false
			actualCooldown = cooldown

func _clicked():
	if is_active: return
	print("Clicked")
	is_active = true
	#Animation
	if animation: animation.play("Move")
	#Ligth
	if light:
		if light.light_energy == 0:
			light.light_energy = 3
		else:
			light.light_energy = 0
	#VFX
	if effect:
		effect.emitting = true
		
func _deactive():
	is_active = false
