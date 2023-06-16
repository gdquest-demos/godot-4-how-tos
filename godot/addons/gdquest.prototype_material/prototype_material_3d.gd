@tool
class_name PrototypeMaterial3D extends StandardMaterial3D


const TEXTURE_FILENAME := "checkerboard.png"

@export var is_checkered := false:
	set(value):
		is_checkered = value
		albedo_texture = texture if is_checkered else null
		uv1_triplanar = is_checkered

@export var color := Color.WHITE:
	set(value):
		color = value
		albedo_color = color

var texture: Texture2D = null


func _init() -> void:
	super()
	texture = load(get_script().resource_path.get_base_dir().path_join(TEXTURE_FILENAME))
	uv1_triplanar_sharpness = 4.0
