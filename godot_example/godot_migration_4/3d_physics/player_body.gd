extends CharacterBody3D

const PLAYER_SPEED = 5.0


func _physics_process(delta):
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var move_direction = Vector3(input_direction.x, 0.0, input_direction.y)
	velocity = move_direction * PLAYER_SPEED

	move_and_slide()
