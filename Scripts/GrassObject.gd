extends Node3D

func _process(_delta):
	$MultiMeshInstance3D.material_override.set_shader_parameter("player_pos", Globals.posicionPlayer)

