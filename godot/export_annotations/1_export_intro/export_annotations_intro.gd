extends Node2D

enum Type {BONE, ASYNC, ASYNC_FUNCTION}

const PATTERNS := {
	Type.BONE: {
		pattern_sampler = preload("res://shared/background/bone_pattern.png"),
		bg_color = Color("061d54"),
		pattern_color = Color("007ac3"),
	},
	Type.ASYNC: {
		pattern_sampler = preload("res://shared/background/async_pattern.svg"),
		bg_color = Color("6a1900"),
		pattern_color = Color("b05737"),
	},
	Type.ASYNC_FUNCTION: {
		pattern_sampler = preload("res://shared/background/async_function_pattern.svg"),
		bg_color = Color("15593f"),
		pattern_color = Color("9fdd51"),
	},
}

@export var type := Type.BONE


func _ready() -> void:
	for key in PATTERNS[type]:
		%Background.pattern.material.set_shader_parameter(key, PATTERNS[type][key])
