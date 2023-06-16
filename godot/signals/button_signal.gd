extends Control


func _ready():
	# Connect the button's pressed signal to a lambda function, using code.
	%Button.pressed.connect(
		func toggle_texture_and_button():
			%TextureRect.visible = not %TextureRect.visible
			%Button.text = "Hide" if %TextureRect.visible else "Show"
	)
