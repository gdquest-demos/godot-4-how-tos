extends Character2D

signal count_updated

# These two variables are attached to the class (the script resource).
# They are shared between all instances.
static var delete_count := 0
static var hurt_count := 0


func _ready() -> void:
	%Buttons.delete.gui_input.connect(func(event: InputEvent):
		if event.is_action_pressed("click_primary"):
			delete()
	)
	%Buttons.hurt.gui_input.connect(func(event: InputEvent):
		if event.is_action_pressed("click_primary"):
			hurt()
	)


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
