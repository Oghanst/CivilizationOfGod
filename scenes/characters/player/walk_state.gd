extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D
@export var speed: int = 50


# _on_process() 每帧调用，用于逻辑更新
func _on_process(_delta : float) -> void:
	pass

# _on_physics_process() 每物理帧调用，用于物理更新
func _on_physics_process(_delta : float) -> void:
	var direction: Vector2 = GameInputEvent.movement_input()

	if direction == Vector2.LEFT:
		animated_sprite_2d.play("walk_left")
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play("walk_right")
	elif direction == Vector2.UP:
		animated_sprite_2d.play("walk_back")
	elif direction == Vector2.DOWN:
		animated_sprite_2d.play("walk_front")

	if direction != Vector2.ZERO:
		player.player_direction = direction
		
	player.velocity = direction * speed
	player.move_and_slide()

# _on_next_transitions() 每物理帧调用，用于检查状态转换条件。
func _on_next_transitions() -> void:
	if !GameInputEvent.is_movement_input():
		transition.emit("Idle")

# _on_enter() 当状态机进入该状态时调用
func _on_enter() -> void:
	pass

# _on_exit() 当状态机退出该状态时调用
func _on_exit() -> void:
	animated_sprite_2d.stop()
