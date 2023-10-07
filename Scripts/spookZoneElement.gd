extends Node

@export var spook_area:Area3D
@export var spook_parent_logic_path:NodePath
var spook_parent

#spook_area area3D collision tiene que tener nada mas mask 2 para que funcione
func _ready():
	spook_parent = get_node(spook_parent_logic_path)
	_set_correct_area_params(spook_area)
	spook_area.connect('area_entered', _spookable)
	spook_area.connect('area_exited', _not_spookable)

func _set_correct_area_params(_spook_area):
	_spook_area.input_ray_pickable = false
	_spook_area.set_collision_mask_value(1, false)
	_spook_area.set_collision_mask_value(2, true)
	_spook_area.set_collision_layer_value(1,false)
	_spook_area.top_level = true

func _spookable(area):
	if "spookable" in spook_parent:
		spook_parent.spookable = true
	else:
		printerr('Tu spook parent:', spook_parent.get_parent().name, ' no tiene la variable spookable')
	
func _not_spookable(area):
	if "spookable" in spook_parent:
		spook_parent.spookable = false
	else:
		printerr('Tu spook parent:', spook_parent.get_parent().name, ' no tiene la variable spookable')
