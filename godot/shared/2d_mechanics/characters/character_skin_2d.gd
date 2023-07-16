class_name CharacterSkin2D extends Node2D

signal animation_finished

func _ready() -> void:
	%AnimationPlayer.connect("animation_finished", func(anim_name: String) -> void:
		animation_finished.emit()
	)

func hurt() -> void:
	%AnimationPlayer.speed_scale = 0.4
	%AnimationPlayer.play("hurt")
