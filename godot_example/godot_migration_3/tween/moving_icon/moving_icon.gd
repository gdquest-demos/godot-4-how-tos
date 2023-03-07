extends Node2D

onready var sprite = $"%Sprite"
onready var tween : Tween = $"%Tween"


func _unhandled_input(event):
	if !(event is InputEventMouseButton): return
	if (event.is_pressed()):
		var mouse = get_viewport().get_mouse_position()
		walk_to(mouse)
	
func walk_to(target : Vector2):
	if tween.is_active(): return
	var time = global_position.distance_to(target) / 1000.0
	tween.interpolate_property(self, "global_position", global_position, target, time)
	tween.start()
