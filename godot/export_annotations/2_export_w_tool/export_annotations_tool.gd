@tool
extends Node2D

enum Type {ELLIPSE, RECTANGLE}

const PATTERNS := {
	Type.ELLIPSE: {
		pattern_sampler = preload("../ellipses.svg"),
		bg_color = Color("061d54"),
		pattern_color = Color("007ac3"),
	},
	Type.RECTANGLE: {
		pattern_sampler = preload("../rectangles.svg"),
		bg_color = Color("15593f"),
		pattern_color = Color("9fdd51"),
	},
}

@export var type := Type.ELLIPSE:
	set(value):
		type = value
		if background == null:
			return

		for key in PATTERNS[type]:
			background.pattern.material.set_shader_parameter(key, PATTERNS[type][key])

@onready var background: CanvasLayer = %Background


func _ready() -> void:
	type = type
