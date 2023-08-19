extends Node2D


var max_health := 100:
	set = set_max_health
var health := max_health:
	set = set_health,
	get = get_health


func set_max_health(new_value: int) -> void:
	var difference := new_value - max_health
	max_health = new_value
	%ProgressBar.max_value = max_health
	health += difference


func set_health(new_health: int) -> void:
	if new_health < health:
		%HappyBooSkin.hurt()
	
	health = clamp(new_health, 0, max_health)
	var tween := create_tween().set_parallel()
	tween.tween_property(%ProgressBar, "value", new_health, 0.6)
	tween.tween_method(
		func(value): %Label.text = "Health: " + str(round(value)),
		%ProgressBar.value, new_health, 0.6
	)


func get_health() -> int:
	return %ProgressBar.value 


func _ready():
	%HappyBooSkin.idle()
	%HappyBooSkin.animation_finished.connect(
		func():
			%HappyBooSkin.idle()
	)
	%ProgressBar.value = health

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click_primary"):
		health -= 10
