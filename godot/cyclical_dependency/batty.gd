extends Character2D

const Player := preload("happy_boo.gd")

const SPEED := 400.0
const MINIMUM_DISTANCE := 100.0

var _player: Player = null


func setup(player: Player) -> void:
	_player = player


func _physics_process(delta: float) -> void:
	var direction := _player.global_position - global_position
	if direction.length() > MINIMUM_DISTANCE:
		velocity = direction.normalized() * SPEED
		move_and_slide()
