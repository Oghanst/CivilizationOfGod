class_name InteractableComponent
extends Area2D

signal interactable_activated
signal interactable_deactivated


func _on_body_exited(body:Node2D) -> void:
	print("body exited")
	interactable_deactivated.emit()

func _on_body_entered(body:Node2D) -> void:
	print("body entered")
	interactable_activated.emit()
