extends CharacterSkin2D


func idle():
	state_machine.travel("idle")


func hurt():
	animation_tree[HURT_SHOT_PATH] = true
