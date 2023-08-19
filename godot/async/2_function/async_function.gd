1extends Control

var button_group := ButtonGroup.new()


func _ready() -> void:
	for check_box in %CheckBoxes.get_children():
		check_box.button_group = button_group

	while true:
		var index := await wait_button_press()
		%Characters.get_child(index).hurt()


func wait_button_press() -> int:
	await %ButtonHurt.pressed
	return button_group.get_pressed_button().get_index()
