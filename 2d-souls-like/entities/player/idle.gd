extends State

func input(_root: CharacterBody2D, _event: InputEvent) -> void:
	pass
	
func physics_process(root: CharacterBody2D, delta: float) -> void:
	root.velocity.x = lerpf(root.velocity.x, 0, root.accel*2*delta)
	root.move_and_slide()
	
func process(_root: CharacterBody2D, _delta: float) -> void:
	pass

func enter_state(_from: State, _root: CharacterBody2D, _delta: float) -> void:
	pass
	
func exit_state(_to: State, _root: CharacterBody2D, _delta: float) -> void:
	pass
