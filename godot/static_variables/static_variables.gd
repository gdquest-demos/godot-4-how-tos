extends Control

const Character := preload("character_2d.gd")


func _ready() -> void:
	for enemy in %Enemies.get_children():
		enemy.count_updated.connect(_on_enemy_count_updated)


func _on_enemy_count_updated() -> void:
	%DeleteCount.label_value.text = str(Character.delete_count)
	%HurtCount.label_value.text = str(Character.hurt_count)
