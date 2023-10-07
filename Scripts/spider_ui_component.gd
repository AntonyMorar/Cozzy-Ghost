extends AspectRatioContainer

@export var gauge_01: TextureRect
@export var gauge_02: TextureRect
@export var gauge_03: TextureRect
@export var boton_01:TextureButton



func _ready():
	Events.connect('aranitaClickeada', _aranitas_add)
	boton_01.connect('pressed', _reset_aranitas)
	

func _aranitas_add():
	Globals.aranita_num += 1
	match Globals.aranita_num:
		0:
			gauge_01.visible = false
			gauge_02.visible = false
			gauge_03.visible = false
		1:
			gauge_01.visible = true
		2:
			gauge_02.visible = true
		3:
			gauge_03.visible = true
			boton_01.visible = true

func _reset_aranitas():
	Globals.aranita_num = 0
	gauge_01.visible = false
	gauge_02.visible = false
	gauge_03.visible = false
	boton_01.visible = false

