extends Node3D
@onready var Controls = $UI/Controls
@onready var Texto = $UI/TextoContainer
@onready var scrollbarY = $UI/Controls/Rotation/RotationY/ScrollY
@onready var scrollbarX = $UI/Controls/Rotation/RotationX/ScrollX
@onready var scrollbarZ = $UI/Controls/Rotation/RotationZ/ScrollZ
@onready var scrollPosX = $UI/Controls/Position/PositionX/PositionX
@onready var scrollPosY = $UI/Controls/Position/PositionY/PositionY
@onready var scrollbarScale = $UI/Controls/Scale/ScaleScroll
var modelo

#@export var KappaModel:Resource

var scrollvalue = Vector3(0,0,0)
var positionvalue = Vector3(0,0,0)

func _ready():
	Events.connect("infoShowcase", _displayShowcase)
	pass
#	_setea_atributos()

func _displayShowcase():
	visible = true
	$Camera3D.current = true
	$UI.visible = true
	_setea_atributos()
	%ScrollX.value = 0
	%ScrollY.value = 0
	%ScrollZ.value = 0
	%ScaleScroll.value = 110
	%PositionX.value = 0
	%PositionY.value = 0
	Texto.visible = true
	Controls.visible = true

func _hideShowcase():
	visible = false
	$Camera3D.current = false
	$UI.visible = false
	_unsetea_atributos()


func _setea_atributos():
	%Titulo.text = '[b]' + Globals.Titulo
	%Descripcion.text = get_text()
	get_model(self, "ModeloShowcase")
	modelo = $ModeloShowcase

func _unsetea_atributos():
	%Titulo.text = ''
	%Descripcion.text = ''
	modelo.free()

# ROTATION ROTATION ROTATION ROTATION
# ROTATION ROTATION ROTATION ROTATION
# ROTATION ROTATION ROTATION ROTATION

func _on_scroll_y_scrolling():
	scrollvalue.y = scrollbarY.value*0.01*2*PI
	modelo.rotation = scrollvalue;

func _on_scroll_x_scrolling():
	scrollvalue.x = scrollbarX.value*0.01*2*PI
	modelo.rotation = scrollvalue;

func _on_scroll_z_scrolling():
	scrollvalue.z = scrollbarZ.value*0.01*2*PI
	modelo.rotation = scrollvalue;

# SCALE SCALE SCALE SCALE SCALE SCALE
# SCALE SCALE SCALE SCALE SCALE SCALE
# SCALE SCALE SCALE SCALE SCALE SCALE

func _on_scale_scroll_scrolling():
	modelo.scale = Vector3(scrollbarScale.value*0.01,scrollbarScale.value*0.01,scrollbarScale.value*0.01)

# POSITION POSITION POSITION POSITION
# POSITION POSITION POSITION POSITION
# POSITION POSITION POSITION POSITION

func _on_position_x_scrolling():
	positionvalue.x = scrollPosX.value*0.1
	modelo.position = positionvalue;
	
func _on_position_y_scrolling():
	positionvalue.y = scrollPosY.value*0.1
	modelo.position = positionvalue;
	

# TOGGLE TOGGLE TOGGLE TOGGLE TOGGLE 
# TOGGLE TOGGLE TOGGLE TOGGLE TOGGLE 
# TOGGLE TOGGLE TOGGLE TOGGLE TOGGLE 
func _on_toggle_controls_pressed():
	if(Controls.visible):
		Controls.visible = false
	else:
		Controls.visible = true
	

func _on_toggle_text_pressed():
	if(Texto.visible):
		Texto.visible = false
	else:
		Texto.visible = true


func _on_back_pressed():
	_hideShowcase()	
	Events.emit_signal("cierraShowcase")
#	get_tree().change_scene_to_file("res://Scenes/MainWorld.tscn")


# DRAGGABLE DRAGGABLE DRAGGABLE DRAGGABLE
# DRAGGABLE DRAGGABLE DRAGGABLE DRAGGABLE
# DRAGGABLE DRAGGABLE DRAGGABLE DRAGGABLE

func _on_controls_gui_input(event):
	if event is InputEventScreenDrag:
		Controls.position += event.relative


func _on_texto_container_gui_input(event):
	if event is InputEventScreenDrag:
		Texto.position += event.relative



func get_text()->String:
	var workfile = FileAccess.open(Globals.TextoPath, FileAccess.READ)
	var content = workfile.get_as_text()
	workfile.close()
	return content

func get_model(_parent, _name)->void:
	var scene = load(Globals.ObjectPath)
	var instance = scene.instantiate()
	instance.set_name(_name)
	instance.grabbed = true
	
	for _meshInstances in instance.get_child(0).get_children():
		_meshInstances.mesh.resource_local_to_scene = true
	
	_parent.add_child(instance)



