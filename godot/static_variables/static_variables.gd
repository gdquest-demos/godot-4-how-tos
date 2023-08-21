extends Control

const Mob := preload("static_variables_mob.gd")


func _ready() -> void:
	for enemy in %Enemies.get_children():
		enemy.count_updated.connect(_on_enemy_count_updated)


func _on_enemy_count_updated() -> void:
	%DeleteCount.label_value.text = str(Mob.delete_count)
	%HurtCount.label_value.text = str(Mob.hurt_count)
