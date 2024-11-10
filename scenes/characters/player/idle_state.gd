extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D


# _on_process() 每帧调用，用于逻辑更新
func _on_process(_delta : float) -> void:
	pass

# _on_physics_process() 每物理帧调用，用于物理更新
func _on_physics_process(_delta : float) -> void:
	var direction: Vector2 = player.player_direction

	if direction == Vector2.LEFT:
		animated_sprite_2d.play("idle_left")
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play("idle_right")
	elif direction == Vector2.UP:
		animated_sprite_2d.play("idle_back")
	elif direction == Vector2.DOWN:
		animated_sprite_2d.play("idle_front")
	else:
		animated_sprite_2d.play("idle_front")

# _on_next_transitions() 每物理帧调用，用于检查状态转换条件。
func _on_next_transitions() -> void:
	GameInputEvent.movement_input()

	if GameInputEvent.is_movement_input():
		transition.emit("Walk")

	if GameInputEvent.use_tool():
		if player.current_tool == DataTypes.Tools.AxeWood:
			transition.emit("Chopping")
		elif player.current_tool == DataTypes.Tools.WaterCrops:
			transition.emit("Watering")
		elif player.current_tool == DataTypes.Tools.TillGround:
			transition.emit("Tilling")

# _on_enter() 当状态机进入该状态时调用
func _on_enter() -> void:
	pass

# _on_exit() 当状态机退出该状态时调用
func _on_exit() -> void:
	animated_sprite_2d.stop()
