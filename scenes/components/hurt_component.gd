class_name HurtComponent
extends Area2D

@export var tool : DataTypes.Tools = DataTypes.Tools.None

signal hurt


func _on_area_entered(area:Area2D) -> void:
	var hit_componet = area as HitComponent

	if hit_componet != null and hit_componet.current_tool == tool:
		hurt.emit(hit_componet.hit_damage)