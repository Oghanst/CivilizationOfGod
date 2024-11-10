extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D
@export var hit_component_collision_shape: CollisionShape2D

func _ready() -> void:
	hit_component_collision_shape.disabled = true
	hit_component_collision_shape.position = Vector2(0, 8)

# _on_process() 每帧调用，用于逻辑更新
func _on_process(_delta : float) -> void:
	pass

# _on_physics_process() 每物理帧调用，用于物理更新
func _on_physics_process(_delta : float) -> void:
	pass

# _on_next_transitions() 每物理帧调用，用于检查状态转换条件。
func _on_next_transitions() -> void:
	if !animated_sprite_2d.is_playing():
		transition.emit("Idle")

# _on_enter() 当状态机进入该状态时调用
func _on_enter() -> void:
	hit_component_collision_shape.disabled = false
	if player.player_direction == Vector2.UP:
		animated_sprite_2d.play("chopping_back")
		hit_component_collision_shape.position = Vector2(0, -11)
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("chopping_front")
		hit_component_collision_shape.position = Vector2(0, 11)
	elif player.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("chopping_left")
		hit_component_collision_shape.position = Vector2(-9, 8)
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("chopping_right")
		hit_component_collision_shape.position = Vector2(9, 8)
	else:
		animated_sprite_2d.play("chopping_front")
		hit_component_collision_shape.position = Vector2(0, 11)

	

# _on_exit() 当状态机退出该状态时调用
func _on_exit() -> void:
	animated_sprite_2d.stop()
	hit_component_collision_shape.disabled = true
	hit_component_collision_shape.position = Vector2(0, 8)
