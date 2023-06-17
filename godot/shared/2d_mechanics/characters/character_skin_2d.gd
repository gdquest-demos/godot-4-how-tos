class_name CharacterSkin2D extends Node2D

const STATE_MACHINE_PLAYBACK := "parameters/StateMachine/playback"
const HURT_SHOT_PATH := "parameters/HurtShot/request"
const HURT_TIME_SCALE_PATH := "parameters/HurtTimeScale/scale"

@onready var animation_tree: AnimationTree = %AnimationTree
@onready var state_machine: AnimationNodeStateMachinePlayback = animation_tree[STATE_MACHINE_PLAYBACK]


func idle():
	state_machine.travel("idle")


func walk():
	state_machine.travel("walk")


func hurt(time_scale: float = 1.0):
	animation_tree[HURT_TIME_SCALE_PATH] = time_scale
	animation_tree[HURT_SHOT_PATH] = true
