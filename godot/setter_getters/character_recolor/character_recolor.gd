extends Node

@onready var color_picker_button = %ColorPickerButton
@onready var gobot_skin = %GobotSkin

func _ready():
	color_picker_button.color = gobot_skin.color
	color_picker_button.color_changed.connect(
		func(new_color):
			gobot_skin.color = new_color
	)
