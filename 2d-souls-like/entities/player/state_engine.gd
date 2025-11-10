extends StateEngine

func calc_state(delta: float) -> void:
	var direction = Input.get_axis("left", "right")
	if Input.is_action_just_pressed("attack"):
		change_state("Attack", delta)
		return
	if Input.is_action_just_pressed("dodge"):
		change_state("Dodge", delta)
		return
	if Input.is_action_just_pressed("parry"):
		change_state("Parry", delta)
		return
	if direction:
		change_state("Run", delta)
		return
	change_state("Idle", delta)
	return
