extends Node2D

const TypedCharacter2D := preload("characters/character_2d.gd")

const ItemUIScene := preload("inventory/item_ui.tscn")


func _ready() -> void:
	# Because of type mismatch (Array[Node] vs Array[TypedCharacter2D]) we can't just do:
	# var characters: Array[TypedCharacter2D] = %Characters.get_children()
	var characters: Array[TypedCharacter2D] = []
	characters.assign(%Characters.get_children())

	for character in characters:
		# Now we get autocomplete on character.|
		for item in character.items:
			var item_ui := ItemUIScene.instantiate()
			character.inventory_ui_list.add_child(item_ui)
			item_ui.name_label.text = item.name
			item_ui.stack_label.text = "%d" % item.stack
