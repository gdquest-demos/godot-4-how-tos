extends Panel

var inner_color := Color.BLACK:
	get:
		return %ColorRect.color

	set(value):
		inner_color = value
		%ColorRect.color = value
