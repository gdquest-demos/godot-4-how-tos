extends Control

signal texture_visibility_changed(visibility)

onready var button: Button = $"%Button"
onready var texture_rect: TextureRect = $"%TextureRect"


func _ready() -> void:
	button.connect("pressed", self, "_on_button_pressed")


func _on_button_pressed() -> void:
	texture_rect.visible = not texture_rect.visible
	button.text = "Hide!" if texture_rect.visible else "Show!"
	emit_signal("texture_visibility_changed", texture_rect.visible)