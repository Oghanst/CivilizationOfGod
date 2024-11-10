class_name NodeState
extends Node

# signal transition 是一个信号，用于通知状态机切换状态
@warning_ignore("unused_signal")
signal transition 

# _on_process() 每帧调用，用于逻辑更新
func _on_process(_delta : float) -> void:
	pass

# _on_physics_process() 每物理帧调用，用于物理更新
func _on_physics_process(_delta : float) -> void:
	pass

# _on_next_transitions() 每物理帧调用，用于检查状态转换条件。
func _on_next_transitions() -> void:
	pass

# _on_enter() 当状态机进入该状态时调用
func _on_enter() -> void:
	pass

# _on_exit() 当状态机退出该状态时调用
func _on_exit() -> void:
	pass
