extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

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
	if player.player_direction == Vector2.UP:
		animated_sprite_2d.play("tilling_back")
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("tilling_front")
	elif player.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("tilling_left")
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("tilling_right")
	else:
		animated_sprite_2d.play("tilling_front")

	

# _on_exit() 当状态机退出该状态时调用
func _on_exit() -> void:
	animated_sprite_2d.stop()