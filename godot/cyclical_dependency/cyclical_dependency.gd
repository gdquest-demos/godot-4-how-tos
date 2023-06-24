extends Node2D


func _ready() -> void:
	%Batty.setup(%HappyBoo)
	%HappyBoo.setup(%Batty)
