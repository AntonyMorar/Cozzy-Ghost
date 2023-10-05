extends Node

@onready var anim = $"../AnimationPlayer"
@onready var anim_front = $"../AnimationPlayerFront"
@export var leaves_back:Array[Sprite2D]
@export var leaves_front:Array[Sprite2D]
var tween:Tween

func _ready():
	anim.play("leaf_01")
	anim_front.play("leaf_front_01")

func resize_leafs():
	for leaf in leaves_back:
		var r_scale = randf_range(0.3,0.5)
		var r_rotation = randi_range(0, 10)
		leaf.scale = Vector2(r_scale, r_scale)
		tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(leaf, "rotation", r_rotation, 5.0)

func resize_leafs_front():
	for leaf in leaves_front:
		var r_scale = randf_range(0.7,1.2)
		var r_rotation = randi_range(0, 10)
		leaf.scale = Vector2(r_scale, r_scale)
		tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(leaf, "rotation", r_rotation, 7.0)
		
