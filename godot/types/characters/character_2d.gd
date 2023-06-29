extends Character2D

@export var items: Array[Item] = []

@onready var inventory_ui_list: VBoxContainer = %InventoryUI.get_node("VBoxContainer")
