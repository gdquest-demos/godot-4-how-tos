extends Node2D


func _ready():
	play_idle_animation()

func play_idle_animation():
	%AnimationPlayer.play("idle")


func play_walk_animation():
	%AnimationPlayer.play("walk")
