@icon("res://addons/stateengine/state.png")
extends Node
class_name State

@export
var transitions: Array[String]
var ongoing: bool = false

func input(root: CharacterBody2D, event: InputEvent) -> void:
	pass
	
func physics_process(root: CharacterBody2D, delta: float) -> void:
	pass
	
func process(root: CharacterBody2D, delta: float) -> void:
	pass

func enter_state(from: State, root: CharacterBody2D, delta: float) -> void:
	pass
	
func exit_state(to: State, root: CharacterBody2D, delta: float) -> void:
	pass
