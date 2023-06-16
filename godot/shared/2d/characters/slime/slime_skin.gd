extends CharacterSkin2D


func idle():
	state_machine.travel("idle")


func walk():
	state_machine.travel("walk")


func hurt():
	animation_tree[HURT_SHOT_PATH] = true
