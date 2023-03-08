extends Node2D

export var velocity := 100.0
onready var player: Sprite = $Player


func _process(delta: float) -> void:
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	player.position += input_direction * velocity * delta