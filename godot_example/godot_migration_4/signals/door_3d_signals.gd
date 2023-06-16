extends Area3D


# In this example, signals are connected through the editor.
func _on_body_entered(body):
	$AnimationPlayer.play("open")


func _on_body_exited(body):
	$AnimationPlayer.play("close")
