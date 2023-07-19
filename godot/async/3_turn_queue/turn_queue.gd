extends Control

@onready var cursor: Sprite2D = %Cursor2D
@onready var characters: Node2D = %Characters
@onready var button_player_turn_done: Button = %ButtonPlayerTurnDone


func _ready() -> void:
	# Turn-base style main loop
	while true:
		for character in characters.get_children():
			# Do fancy animations, attack, hurt, etc. Here we only play a "hurt" animation.
			# When the player turn comes it waits for the player to click the "Turn Done" button.
			await play_next_turn(character)
			const TURN_END_DELAY := 0.4
			await get_tree().create_timer(TURN_END_DELAY).timeout


func play_next_turn(character: Character2D) -> void:
	button_player_turn_done.disabled = true
	cursor.reparent(character, false)

	character.skin.hurt()
	await character.skin.animation_finished

	if character.has_method("scream"):
		await character.scream()

	const PLAYER_GROUP := "player"
	if character.is_in_group(PLAYER_GROUP):
		button_player_turn_done.disabled = false
		await button_player_turn_done.pressed
