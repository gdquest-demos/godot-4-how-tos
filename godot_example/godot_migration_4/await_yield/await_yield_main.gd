extends Node

signal finish_counting

func _ready():
	var goal = 3
	print("Let's count!")
	await count_to(goal)
	print("I've counted to " + str(goal) + "!")
	
func count_to(goal : int):
	for i in goal:
		await get_tree().create_timer(1.0).timeout
		print(i + 1)
	emit_signal("finish_counting")
