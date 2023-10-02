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
	_setea_atributos()

func _setea_atributos():
	%Titulo.text = '[b]' + Globals.KappaResource.Titulo
	%Descripcion.text = Globals.KappaResource.get_text()
	Globals.KappaResource.get_model(self, "ModeloShowcase")
	modelo = $ModeloShowcase


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

func _on_toggle_controls_toggled(button_pressed):
	if(button_pressed):
		Controls.visible = false
	else:
		Controls.visible = true

func _on_toggle_text_toggled(button_pressed):
	if(button_pressed):
		Texto.visible = false
	else:
		Texto.visible = true


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainWorld.tscn")


# DRAGGABLE DRAGGABLE DRAGGABLE DRAGGABLE
# DRAGGABLE DRAGGABLE DRAGGABLE DRAGGABLE
# DRAGGABLE DRAGGABLE DRAGGABLE DRAGGABLE

func _on_controls_gui_input(event):
	if event is InputEventScreenDrag:
		Controls.position += event.relative


func _on_texto_container_gui_input(event):
	if event is InputEventScreenDrag:
		Texto.position += event.relative

