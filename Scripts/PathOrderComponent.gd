extends Node

@export var ordered_list_of_paths: Array[Path3D]
@export var character: Node3D
@export var animation: AnimationPlayer
@export var pause_spook_time = 1.5
var anim_num = 0

func _ready():
	animation.connect('animation_finished', _anim_finished)
	animation.play("path_"+str(anim_num))
	Events.connect('spookeado', _pausa_movimiento)

func _anim_finished(anim_name):
	var anim_name_num = anim_name.trim_suffix('path_').to_int()
	match  anim_name_num:
		0:
			anim_num = randi_range(1,2)
			animation.play("path_"+str(anim_num))
		1:
			anim_num = 0
			animation.play("path_"+str(anim_num))
		2:
			anim_num = 0
			animation.play("path_"+str(anim_num))

func _pausa_movimiento():
	animation.pause()
	await get_tree().create_timer(pause_spook_time).timeout
	animation.play()
