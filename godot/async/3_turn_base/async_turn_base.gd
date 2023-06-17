extends Control

const DELAY := 0.2
const PLAYER_GROUP := "player"

@onready var cursor: Sprite2D = %Cursor2D
@onready var characters: Node2D = %Characters
@onready var button_player_turn_done: Button = %ButtonPlayerTurnDone
@onready var tween := create_tween()


func _ready() -> void:
	tween.kill()

	# Turn-base style main loop
	while true:
		for character in characters.get_children():
			var skin: CharacterSkin2D = character.skin
			# Do fancy animations, attack, hurt, etc. Here we only play a "hurt" animation.
			# When the player turn comes it waits for the player to click the "Turn Done" button.
			await play_next_turn(character)
			await get_tree().create_timer(DELAY).timeout


func play_next_turn(character: Character2D) -> void:
	button_player_turn_done.disabled = true
	cursor.reparent(character, false)

	character.skin.hurt()
	await character.skin.animation_tree.animation_finished

	if character.has_method("scream"):
		await character.scream()

	if character.is_in_group(PLAYER_GROUP):
		button_player_turn_done.disabled = false
		await button_player_turn_done.pressed
