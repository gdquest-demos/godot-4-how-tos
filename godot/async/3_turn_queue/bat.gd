extends Character2D

const DEFAULT_LABEL_FONT_SIZE := 24

const SCREAMS := ["Ouchhh!", "Uoogww...", "Blugh..."]
const SCREAM_DURATION := 0.3
const SCREAM_DELAY := 0.2

var rng := RandomNumberGenerator.new()

@onready var label := %Label
@onready var tween := create_tween()


func _ready() -> void:
	tween.kill()


func scream() -> void:
	label.text = SCREAMS[rng.randi_range(0, SCREAMS.size() - 1)]

	tween.kill()
	tween = create_tween()
	tween.tween_property(
		label.label_settings,
		"font_size",
		2 * label.label_settings.font_size,
		SCREAM_DURATION
	)

	await tween.finished
	await get_tree().create_timer(SCREAM_DELAY).timeout

	label.label_settings.font_size = DEFAULT_LABEL_FONT_SIZE
	label.text = ""
