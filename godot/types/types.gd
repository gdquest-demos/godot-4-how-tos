extends Node2D

const ItemUIScene := preload("inventory/item_ui.tscn")

@onready var characters: Array[Character2D] = [%Bat, %HappyBoo, %Slime]

func _ready() -> void:
	# Given this scene tree:
	# Characters (%)
	#   - Bat
	#   - HappyBoo
	#   - Slime
	#
	# We can't just do:
	# var character: Array[Character2D] = %Characters.get_children()
	#
	# Nor:
	# # var character := %Characters.get_children() as Array[Character2D]
	for character in characters:
		for item in character.items:
			var item_ui := ItemUIScene.instantiate()
			character.inventory_ui_list.add_child(item_ui)
			item_ui.name_label.text = item.name
			item_ui.stack_label.text = "%d" % item.max_stack
