extends Character2D

const Batty := preload("batty.gd")

const TEXT := "Distance to Batty: %.0f"
const SPEED := 600.0

var _batty: Batty = null

@onready var label: Label = $Label


func setup(batty: Batty) -> void:
	_batty = batty


func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	velocity = direction * SPEED
	move_and_slide()
	skin.idle() if direction.is_zero_approx() else skin.walk()

	var batty_distance := (_batty.global_position - global_position).length()
	label.text = TEXT % batty_distance
