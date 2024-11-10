extends Sprite2D

@onready var hurt_component : HurtComponent = $HurtComponent
@onready var damage_component : DamageComponent = $DamageComponent

var log_scene = preload("res://scenes/objects/tree/log.tscn")

func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)

func on_hurt(damage:int) -> void:
	damage_component.apply_damage(damage)

func on_max_damage_reached() -> void:
	call_deferred("add_log_scene") # This is a way to call a function in the next frame
	print("max damage reached")
	queue_free()

func add_log_scene() -> void:
	var log_instance = log_scene.instantiate() as Node2D
	log_instance.global_position = global_position # global_position is the position of this node
	get_parent().add_child(log_instance)
