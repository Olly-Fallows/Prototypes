@icon("res://addons/stateengine/engine.png")
extends Node
class_name StateEngine

@export
var root: CharacterBody2D
@export
var current_state: State

var states: Dictionary

func _ready() -> void:
	for c in get_children():
		if c is State:
			states[c.name] = c

func _input(event: InputEvent) -> void:
	if current_state != null:
		current_state.input(root, event)

func _physics_process(delta: float) -> void:
	if current_state != null:
		current_state.physics_process(root, delta)
	calc_state(delta)

func _process(delta: float) -> void:
	if current_state != null:
		current_state.process(root, delta)

func change_state(to: String, delta: float, forced: bool = false) -> void:
	if to == current_state.name:
		return
	print(current_state.name+ " : " +to)
	if not forced:
		if current_state.ongoing:
			return
		if to not in current_state.transitions:
			return
	if to not in states.keys():
		return
	current_state.exit_state(states[to], root, delta)
	states[to].enter_state(current_state, root, delta)
	current_state = states[to]

func calc_state(delta: float) -> void:
	pass
