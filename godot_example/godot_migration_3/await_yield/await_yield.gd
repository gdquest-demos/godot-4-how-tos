extends Node

signal finish_counting

func _ready():
	var goal = 3
	print("Let's count!")
	count_to(goal)
	yield(self, "finish_counting")
	print("I've counted to " + str(goal) + "!")
	
func count_to(goal : int):
	for i in goal:
		yield(get_tree().create_timer(1.0), "timeout")
		print(i + 1)
	emit_signal("finish_counting")
