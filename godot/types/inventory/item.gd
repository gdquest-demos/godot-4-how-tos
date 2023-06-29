class_name Item extends Resource

@export var name := ""
@export var max_stack := 0


func _init(n: String, ms: int) -> void:
	name = n
	max_stack = ms
