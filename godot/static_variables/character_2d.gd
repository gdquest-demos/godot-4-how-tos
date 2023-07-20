extends Character2D

signal count_updated

static var delete_count := 0
static var hurt_count := 0


func _ready() -> void:
	%Buttons.delete.gui_input.connect(callback.bind(delete))
	%Buttons.hurt.gui_input.connect(callback.bind(hurt))


func callback(event: InputEvent, action: Callable) -> void:
		if event.is_action_pressed("click_primary"):
			action.call()


func delete() -> void:
	delete_count += 1
	queue_free()
	count_updated.emit()

func hurt() -> void:
	skin.hurt()
	await skin.animation_player.animation_finished
	skin.idle()
	hurt_count += 1
	count_updated.emit()
