extends Node

func _ready():
	$AnimationPlayer.play("night")

func _play_day():
	$AnimationPlayer.play("day")
	
func _play_night():
	$AnimationPlayer.play("night")

func _night_starts():
	Events.emit_signal('nightStarts')

func _day_starts():
	Events.emit_signal('dayStarts')
