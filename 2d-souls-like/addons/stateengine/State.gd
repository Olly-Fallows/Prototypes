extends Node
class_name State

@export
var transitions: Array[String]

func input(root: CharacterBody2D, event: InputEvent) -> void:
	pass
	
func physics_process(root: CharacterBody2D, delta: float) -> void:
	pass
	
func process(root: CharacterBody2D, delta: float) -> void:
	pass

func enter_state(root: CharacterBody2D, delta: float) -> void:
	pass
	
func exit_state(root: CharacterBody2D, delta: float) -> void:
	pass
