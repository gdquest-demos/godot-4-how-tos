extends Control

signal texture_visibility_changed

@onready var texture_rect: TextureRect = %TextureRect
@onready var button: Button = %Button


func _ready():
	button.pressed.connect(func():
		texture_rect.visible = not texture_rect.visible
		button.text = "Hide!" if texture_rect.visible else "Show!"
		texture_visibility_changed.emit(texture_rect.visible)
	)
