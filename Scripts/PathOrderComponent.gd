extends Node

@export var ordered_list_of_paths: Array[Path3D]
@export var character: Node3D
@export var animation: AnimationPlayer
var anim_num = 0

func _ready():
	animation.connect('animation_finished', _anim_finished)
	animation.play("path_"+str(anim_num))

func _change_character_path(_path_num):
	character.reparent(ordered_list_of_paths[_path_num].get_child(0))
	character.position = Vector3(0,0,0)
	character.rotation = Vector3(0,0,0)
	

func _anim_finished(anim_name):
	var anim_name_num = anim_name.trim_suffix('path_').to_int()
	match  anim_name_num:
		0:
			anim_num = randi_range(1,2)
			_change_character_path(anim_num)
			animation.play("path_"+str(anim_num))
		1:
			anim_num = 0
			_change_character_path(anim_num)
			animation.play("path_"+str(anim_num))
		2:
			anim_num = 0
			_change_character_path(anim_num)
			animation.play("path_"+str(anim_num))

