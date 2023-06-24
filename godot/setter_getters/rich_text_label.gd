extends RichTextLabel

const TEXT := "[center]It's the [color=#{color}]#{color}[/color] color![/center]"

var _panel: Panel = null


func setup(panel: Panel) -> void:
	_panel = panel


func update_color() -> void:
	text = TEXT.format({color = _panel.inner_color.to_html(false)})
