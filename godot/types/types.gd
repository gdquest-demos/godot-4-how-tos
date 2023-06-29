extends Node2D

func _ready() -> void:
	# Can't just do:
	# var character: Array[Character2D] = %Characters.get_children()
	#
	# Nor:
	# # var character := %Characters.get_children() as Array[Character2D]
	while true:
		for character in get_characters():
			await get_tree().create_timer(1.0).timeout
			character.skin.hurt()


func get_characters() -> Array[Character2D]:
	var result: Array[Character2D] = []
	for character in %Characters.get_children():
		result.push_back(character)
	return result
