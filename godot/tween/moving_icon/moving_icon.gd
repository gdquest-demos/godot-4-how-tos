extends Node2D

@onready var sprite = %Sprite
var tween : Tween

func _unhandled_input(event):
	if !(event is InputEventMouseButton): return
	if (event.is_pressed()):
		var mouse = get_viewport().get_mouse_position()
		walk_to(mouse)

func walk_to(target : Vector2):
	if tween != null and tween.is_valid(): return
	var time = global_position.distance_to(target) / 1000.0
	tween = create_tween()
	tween.tween_property(self, "position", target, time)
