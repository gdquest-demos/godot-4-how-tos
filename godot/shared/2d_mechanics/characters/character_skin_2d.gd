class_name CharacterSkin2D extends Node2D

signal animation_finished

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	animation_player.animation_finished.connect(func(anim_name: String) -> void:
		animation_finished.emit()
	)


func hurt() -> void:
	animation_player.speed_scale = 0.4
	animation_player.play("hurt")


func idle() -> void:
	animation_player.speed_scale = 1.0
	animation_player.play("idle")


func walk() -> void:
	animation_player.speed_scale = 1.0
	animation_player.play("walk")
