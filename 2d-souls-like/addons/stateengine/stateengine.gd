@tool
extends EditorPlugin


func _enable_plugin() -> void:
	# Add autoloads here.
	pass


func _disable_plugin() -> void:
	# Remove autoloads here.
	pass


func _enter_tree() -> void:
	add_custom_type("Engine", "Node", preload("Engine.gd"), preload("engine.png"))
	add_custom_type("State", "Node", preload("State.gd"), preload("state.png"))


func _exit_tree() -> void:
	remove_custom_type("StateEngine")
	remove_custom_type("State")
