extends Control

const COLOR1 := Color("73275c")
const COLOR2 := Color("ff417d")

var rng := RandomNumberGenerator.new()


func _ready() -> void:
	rng.randomize()
	%RichTextLabel.setup(%Panel)
	_on_timer_timeout()


func _on_timer_timeout() -> void:
	var weight := snappedf(rng.randf(), 0.1)
	%Panel.inner_color = COLOR1.lerp(COLOR2, weight)
	%RichTextLabel.update_color()
