extends TextureButton


func _ready() -> void:
	mouse_entered.connect(func() -> void: modulate = Color("ff417d"))
	mouse_exited.connect(func() -> void: modulate = Color.WHITE)
