extends Node2D

@onready var sprite = %Sprite
var tween : Tween

func _unhandled_input(event):
	if !(event is InputEventMouseButton): return
	if (event.is_pressed()):
		var mouse = get_viewport().get_mouse_position()
		jump_to(mouse)
	
func jump_to(target : Vector2):
	if tween != null and tween.is_valid(): return
	var start_position = global_position
	var dist = max((start_position.distance_to(target) / 2000.0), 0.4)
	tween = create_tween().set_parallel(true)
	tween.tween_property(sprite, "rotation", deg_to_rad(360.0), dist).set_ease(Tween.EASE_IN_OUT).from(0.0)
	tween.tween_property(self, "global_position:x", target.x, dist).set_ease(Tween.EASE_IN_OUT).from(start_position.x)
	tween.tween_property(self, "position:y", -256.0, dist).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE).as_relative()
	tween.chain().tween_property(self, "position:y", start_position.y, dist * 0.8).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property(self, "scale", Vector2(1.2, 0.8), 0.15).set_ease(Tween.EASE_OUT)
	tween.chain().tween_property(self, "scale", Vector2(1.0, 1.0), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
