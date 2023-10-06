extends Node3D

@export var spawner:Node
@export var aranita:PackedScene
@export var spawnerPoints:Array[Node3D]
@export var spawner_time := 1.0

func _ready():
	_call_spawner()

func _call_spawner():
	var spawn_point = spawnerPoints.pick_random()
	spawner._spawn_item(spawn_point.position, spawn_point.rotation, aranita)
	await get_tree().create_timer(spawner_time).timeout
	_call_spawner()
