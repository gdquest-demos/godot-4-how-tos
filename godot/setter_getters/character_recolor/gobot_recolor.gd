@tool
extends "res://models/gobot/gobot_skin.gd"


@export var color := Color.WHITE:
	set(new_color):
		color = new_color
		_body_material.albedo_color = new_color
	get:
		return color 

var _body_material := preload("gobot_body_recolor_material.tres")


func _ready():
	super._ready()
	gobot_model.set_surface_override_material(0, _body_material)
 
