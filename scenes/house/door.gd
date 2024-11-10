extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var interactable_component: InteractableComponent = $InteractableComponent


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable_component.interactable_activated.connect(on_interactable_activated)
	print("ready")
	interactable_component.interactable_deactivated.connect(on_interactable_deactivated)
	collision_layer = 1

func on_interactable_activated() -> void:
	animated_sprite_2d.play("open_doors")
	collision_layer = 2
	print("activated")
	# collision_shape_2d.disabled = true

func on_interactable_deactivated() -> void:
	animated_sprite_2d.play("close_doors")
	collision_layer = 1
	print("deactivated")
	# collision_shape_2d.disabled = false

