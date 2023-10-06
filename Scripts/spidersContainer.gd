extends AspectRatioContainer

@export var long_gauge_01:TextureRect
@export var gauge_02:TextureRect
@export var gauge_03:TextureRect
@export var spider_button:TextureButton

func _ready():
	Events.connect('aranitaClickeada', _add_aranita)
	spider_button.connect('pressed', _unleash_spiders)

func _add_aranita():
	Globals.aranita_num = (Globals.aranita_num + 1)
	match Globals.aranita_num:
		0:
			long_gauge_01.visible = false
			gauge_02.visible = false
			gauge_03.visible = false
		1:
			long_gauge_01.visible = true
		2:
			gauge_02.visible = true
		3: 
			gauge_03.visible = true
			spider_button.visible = true

func _unleash_spiders():
	Globals.aranita_num = 0
	long_gauge_01.visible = false
	gauge_02.visible = false
	gauge_03.visible = false
	spider_button.visible = false
	
