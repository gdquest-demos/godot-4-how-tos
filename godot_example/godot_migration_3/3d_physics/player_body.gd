extends KinematicBody

const PLAYER_SPEED = 10.0


func _process(delta: float) -> void:
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var move_direction = Vector3(-input_direction.y, 0.0, input_direction.x)
	move_and_slide(move_direction * PLAYER_SPEED, Vector3.UP)
