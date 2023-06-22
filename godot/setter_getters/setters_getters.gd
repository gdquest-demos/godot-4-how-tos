extends Control

const COLOR1 := Color("73275c")
const COLOR2 := Color("ff417d")

var cache := {}
var rng := RandomNumberGenerator.new()

var color_weight := 0.0:
	# TODO: couldn't find a useful example for getter
	set(value):
		color_weight = value
		# Suppose we have an expensive color computation
		var color := Color.BLACK
		if color_weight in cache:
			color = cache[color_weight]
			%RichTextLabel.text = (
				"[center]Color(#%s) from [code]cache[%.3f][/code][/center]"
				% [color.to_html(false), color_weight]
			)
		else:
			color = COLOR1.lerp(COLOR2, color_weight)
			cache[color_weight] = color
			%RichTextLabel.text = (
				"[center]Color(#%s) from computation [b]saved[/b] to [code]cache[%.3f][/code][center]"
				% [color.to_html(false), color_weight]
			)
		%Background.pattern.material.set_shader_parameter("bg_color", color)


func _ready() -> void:
	rng.randomize()

func _on_timer_timeout() -> void:
	color_weight = snappedf(rng.randf(), 0.1)
