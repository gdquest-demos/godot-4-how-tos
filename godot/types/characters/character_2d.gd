extends Character2D

const ItemUIScene := preload("../inventory/item_ui.tscn")

@export var items: Array[Item] = []


func _ready() -> void:
	for item in items:
		var item_ui := ItemUIScene.instantiate()
		item_ui.name_label.text = item.name
		item_ui.stack_label.text = "%d" % item.max_stack
		%InventoryUI.add_child(item_ui)


func get_items() -> Array[Item]:
	return items
