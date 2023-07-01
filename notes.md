### General Naming Conventions

Godot 4.0 changed the naming conventions of some nodes, to make easier to understand what they do or to make the overall API more consistent.

The main naming changes that might affect users are:

- Now most `2D` and `3D` nodes with the same functionality have the same names to avoid confusion.
  - `2D` nodes that have a `3D` node counterpart have `2D` in their name (e.g. `Sprite` became `Sprite2D`).
  - `3D` nodes that have a `2D` node counterpart have `3D` in their name (e.g. `Spatial` became `Node3D`).
- `KinematicBody` nodes were replaced with `CharacterBody`.
- The Visual Shader `Uniform` nodes were replaced with `Parameter` (e.g. `VisualShaderNodeColorUniform` became `VisualShaderNodeColorParameter`).
- Names with `ARVR` were replaced with `XR` (the common way of referring to both Augmented Reality and Virtual Reality technologies).

The complete naming convention changes can be check in the [official migration page from Godot documentation](https://docs.godotengine.org/en/stable/tutorials/migrating/upgrading_to_godot_4.html).

### SubViewports

One important change is the difference between Godot 3.0 and Godot 4.0 `Viewports`. In Godot 4.0, `Viewports` are not instantiable; this means they are a class of nodes that are inherited to provide their functionality. The two built-in nodes Godot 4.0 provides that inherit from `Viewport` are:

- `Window`: provides a separate system window to render on.
- `SubViewport`: provides the same functionality as Godot 3.0 `Viewport` node.

In Godot 3.0, the `SceneTree` root (the first node of the `SceneTree` that all nodes are children to) is a `Viewport`. In Godot 4.0, the root is a `Window`. That's an important differentiation, because `Window` nodes provides specific functionality for system windows.

### GDScript Signals and Callables

In Godot 4.0, `signals` were updated with major usability improvements: now they can get referenced as the `signal` built-in types instead of strings, which make human errors like typos much less common, and the code more ergonomic.

The new way to use `signals` is to call their methods `connect()` and `emit()`, which replaces `Node.connect()` and `Node.emit_signal()` respectively.

Godot 4.0 also introduced `Callables`, which are first-class functions in GDScript. This means that function references are mostly not string names anymore, instead they can be directly referenced by name, or local anonymous functions can be created using the `func()` syntax (those are called lambda functions). This ties with the new `signals` usability improvements, making using callbacks much more ergonomic.

The following example shows the difference between using signals in Godot 3.0 and using them Godot 4.0 with a lambda function:

```
# Godot 3.0

extends Control

signal texture_visibility_changed(visibility)

onready var button: Button = $"%Button"
onready var texture_rect: TextureRect = $"%TextureRect"


func _ready() -> void:
	button.connect("pressed", self, "_on_button_pressed")


func _on_button_pressed() -> void:
	texture_rect.visible = not texture_rect.visible
	button.text = "Hide!" if texture_rect.visible else "Show!"
	emit_signal("texture_visibility_changed", texture_rect.visible)
```

```
# Godot 4.0

extends Control

signal texture_visibility_changed

@onready var texture_rect: TextureRect = %TextureRect
@onready var button: Button = %Button


func _ready():
	button.pressed.connect(func():
		texture_rect.visible = not texture_rect.visible
		button.text = "Hide!" if texture_rect.visible else "Show!"
		texture_visibility_changed.emit(texture_rect.visible)
	)
```

### GDScript Keywords

Some GDScript keywords such as `onready` and `export` became annotations in Godot 4.0. The most significant change is that now they're called with a preceding `@` to indicate an annotation.

The following example shows the difference using `onready` and `export` on Godot 3.x and 4.0:

```
# Godot 3.0
extends Node2D

export var velocity := 100.0
onready var player: Sprite = $Player


func _process(delta: float) -> void:
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	player.position += input_direction * velocity * delta
```

```
# Godot 4.0
extends Node2D

@export var velocity := 100.0
@onready var player: Sprite2D = $Player


func _process(delta: float) -> void:
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	player.position += input_direction * velocity * delta
```

### Physics

The first major change in Godot Physics are the new names. The `KinematicBody` nodes became `CharacterBody` nodes, to better represent their main functionality: to provide an easy-to-use physics node with custom movement.

Physics API were also simplified for `CharacterBody`. What previously were three types of movement that required a set of arguments (`move_and_collide`, `move_and_slide` and `move_and_slide_with_snap`) became the method `move_and_slide` that requires no arguments. Instead, `CharacterBody` now have parameters to set so it can simulate the previous behavior, such as `floor_max_angle` and `floor_stop_on_slope`. `CharacterBody` nodes also have a `velocity` attribute that must be set before calling `move_and_slide` on a `_physics_process` frame.

The following code example make this difference clear:

```
# Godot 3.0
extends KinematicBody

const PLAYER_SPEED = 10.0


func _process(delta: float) -> void:
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var move_direction = Vector3(input_direction.x, 0.0, input_direction.y)
	move_and_slide(move_direction * PLAYER_SPEED, Vector3.UP)
```

```
# Godot 4.0
extends CharacterBody3D

const PLAYER_SPEED = 10.0


func _physics_process(delta):
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var move_direction = Vector3(input_direction.x, 0.0, input_direction.y)
	velocity = move_direction * PLAYER_SPEED

	move_and_slide()

```


Another change in Godot 4.0 is the removal of "infinite inertia" on `CharacterBody` nodes. Previously in Godot 3.x, a `KinematicBody` node would be able to push `RigidBody` nodes around without changing any inspector setting. This happened because `KinematicBody` nodes doesn't have the concept of weight or force implicitly like `RigidBody` nodes does, so the Engine would assume those nodes had "inifinite inertia" and  would always be able to push other `RigidBody` nodes around. This specific behavior adds unpredictability to the physics engine, so it was removed and now `KinematicBody` nodes can't push other nodes, unless the user explicitly calls `apply_force` on `RigidBody` nodes or implement other types of pushing behaviors themselves.

An easy way to replicate the "infinite inertia" behavior in Godot 4.0 is to set the nodes in different collision layers. For example, if the Player character is in the `collision_layer` `1`, set the pushable `RigidBody` to be on `collision_mask` `1`, but **not** on `collision_layer` `1`. This will make the `RigidBody` scans for collisions in `collision_layer` `1`, but the Player object will ignore the collision, which will push the object around without affecting the Player.

The last major change is that Godot 4.0 no longer supports Bullet physics (which was the default physics engine in Godot 3.0), instead using its own internalpPhysics engine. This only affects 3D games, but the physics API is the same.

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
