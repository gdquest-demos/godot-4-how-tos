class_name PlayerCyclical
extends Character2D

@export var batty: Batty = null

@onready var label: Label = $Label


func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	const SPEED := 600.0
	velocity = direction * SPEED
	move_and_slide()
	if direction.is_zero_approx():
		skin.idle()
	else:
		skin.walk()

	const TEXT := "Distance to Batty: %.0f"
	var batty_distance := (batty.global_position - global_position).length()
	label.text = TEXT % batty_distance
