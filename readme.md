## Gdscript

### Tweens

The tweening system has undergone a major revamp, resulting in the removal of the old Tween node in favor of `SceneTreeTween`. This new API provides increased flexibility for users.

To create a tween, users can utilize the `create_tween()` method, which generates a tween object capable of receiving tweeners. The tween starts immediately upon its creation, eliminating the need to call `tween.start()`. It's essential to note that a tween without a tweener will result in errors.

Tweeners can't be manually generated; dedicated methods must be called to append them to the tween. By default, the tweens are executed sequentially. This default execution order can be changed and fine tuned with `set_parallel()` and `chain()`.

### Yield to Await

The yield keyword was replaced to await. The change are mainly syntactical, `yield(self, "signal_name")` and `await signal_name` will produce identical result.

#### Example

```
# Godot 3.0
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
```

```
# Godot 4.0
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
```

