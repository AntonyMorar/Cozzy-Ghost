extends Node

@export var path_list: Node3D
var ordered_list_of_paths
@export var character: Node3D
@export var speed_anim:=1.0
@export var animation: AnimationPlayer
@export var pause_spook_time = 0.5
@export var testing = false
var anim_num = 0

func _ready():
	animation.connect('animation_finished', _anim_finished)
	animation.play("path_"+str(anim_num))
	Events.connect('spookeado', _pausa_movimiento)
	ordered_list_of_paths = path_list.get_children()
	for path in ordered_list_of_paths:
		path.get_child(0).get_child(0).remote_path = character.get_path()
		path.get_child(0).rotation_mode = 1
		path.get_child(0).loop = false
		path.get_child(0).use_model_front = true
		path.get_child(0).tilt_enabled = false

func _anim_finished(anim_name):
	var anim_name_num = anim_name.trim_suffix('path_').to_int()
	if testing:
		animation.speed_scale = 3
	else:
		animation.speed_scale = randf_range(0.3,0.7)

	match  anim_name_num:
		0:
			anim_num = [1,9].pick_random()
			animation.play("path_"+str(anim_num))
		1:
			anim_num = [2,3,7].pick_random()
			animation.play("path_"+str(anim_num))
		2:
			anim_num = [4,5].pick_random()
			animation.play("path_"+str(anim_num))
		3:
			anim_num = 0
			animation.play("path_"+str(anim_num))
		4:
			anim_num = 0
			animation.play("path_"+str(anim_num))
		5:
			anim_num = 0
			animation.play("path_"+str(anim_num))
		6:
			anim_num = 2
			animation.play("path_"+str(anim_num))
		7:
			anim_num = 8
			animation.play("path_"+str(anim_num))
		8:
			anim_num = 0
			animation.play("path_"+str(anim_num))
		9:
			anim_num = [10,11]
			animation.play("path_"+str(anim_num))
		10:
			anim_num = [12,13]
			animation.play("path_"+str(anim_num))
		11:
			anim_num = 1
			animation.play("path_"+str(anim_num))
		12:
			anim_num = 10
			animation.play("path_"+str(anim_num))
		13:
			anim_num = 10
			animation.play("path_"+str(anim_num))


func _pausa_movimiento(_spookeado, _amount):
	animation.pause()
	var time_paused = _amount  + pause_spook_time
	await get_tree().create_timer(time_paused).timeout
	animation.play()
