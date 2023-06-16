extends CanvasLayer


func _ready() -> void:
	get_tree().tree_changed.connect(update)
	layer = -1
	var texture_rect := TextureRect.new()
	texture_rect.anchors_preset = TextureRect.PRESET_FULL_RECT
	texture_rect.texture = preload('background.png')
	add_child(texture_rect)


func update() -> void:
	visible = is_inside_tree() and not get_tree().current_scene is Node3D
