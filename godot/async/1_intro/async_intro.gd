extends Control


func _on_button_pressed() -> void:
	%SlimeSkin.hurt()
	await %SlimeSkin.animation_finished
	%Button.disabled = true
	%Button.text = "Can't hurt me!"
