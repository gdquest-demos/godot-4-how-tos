class_name Batty 
extends Character2D

@export var player: PlayerCyclical


func _physics_process(delta: float) -> void:
	const SPEED := 400.0
	const MINIMUM_DISTANCE := 100.0
	var distance := global_position.distance_to(player.global_position)
	if distance > MINIMUM_DISTANCE:
		var direction := global_position.direction_to(player.global_position)
		velocity = direction.normalized() * SPEED
		move_and_slide()
