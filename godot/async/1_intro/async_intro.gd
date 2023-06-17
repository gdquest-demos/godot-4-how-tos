extends Control


func _on_button_hurt_pressed() -> void:
	%SlimeSkin.hurt(0.4)
	await %SlimeSkin.animation_tree.animation_finished
	%ButtonHurt.disabled = true
	%ButtonHurt.text = "Can't hurt me!"
