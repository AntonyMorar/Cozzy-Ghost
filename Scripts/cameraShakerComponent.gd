extends Node

@export var trauma_reduction_rate = 1.0
@export var trauma = 0.0
@export var noise:FastNoiseLite

@export var max_x  = 10.0
@export var max_y  = 10.0
@export var max_z  = 5.0

@export var noise_speed = 50.0
var cam
var time = 0.0

var initial_rotation

func _ready():
	Events.connect('spookeado', _shake_cam)
	cam = get_parent()
	initial_rotation = cam.rotation_degrees as Vector3

func _shake_cam(_spookeado):
	trauma = 1.0
	pass

func _process(delta):
	time += delta
	trauma = max(trauma - delta * trauma_reduction_rate, 0.0)
	print(trauma)
	cam.rotation_degrees.x = initial_rotation.x + max_x * get_shake_intensity() * get_noise_from_seed(0)
	cam.rotation_degrees.y = initial_rotation.y + max_y * get_shake_intensity() * get_noise_from_seed(1)
	cam.rotation_degrees.z = initial_rotation.z + max_z * get_shake_intensity() * get_noise_from_seed(2)

func get_shake_intensity():
	return trauma * trauma

func get_noise_from_seed(_seed):
	noise.seed = _seed
	return noise.get_noise_1d(time*noise_speed)
