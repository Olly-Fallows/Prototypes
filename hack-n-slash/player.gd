extends CharacterBody2D

@export
var speed: float = 275
@export
var accel: float = 10
@export
var jump_vel: float = 800

@export
var knockback: float = 500

var direction : Vector2 = Vector2(0,0)

var attack = preload("res://player_attack.tscn")
var last_attack := Time.get_ticks_msec()
var attack_cooldown := 200

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_vel
	elif Input.is_action_just_released("jump") and not is_on_floor() and velocity.y < 0:
		velocity.y /= 2

	var dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if dir.length() != 0:
		direction = dir
		
	if dir.x:
		velocity.x = lerpf(velocity.x, speed*sign(dir.x), accel*delta)
	else:
		if is_on_floor():
			velocity.x = lerpf(velocity.x, 0, accel*1.5*delta)
		else:
			velocity.x = lerpf(velocity.x, 0, accel*0.25*delta)

	if Input.is_action_just_pressed("ui_accept"):
		if Time.get_ticks_msec()-last_attack > attack_cooldown:
			last_attack = Time.get_ticks_msec()
			var a = attack.instantiate()
			var pos = Vector2()
			if direction.y != 0:
				pos.y = sign(direction.y) * 64
			else:
				pos.x = sign(direction.x) * 64
			a.global_position = pos
			add_child(a)
			a.area_entered.connect(func(_area: Area2D):
				velocity = (global_position - a.global_position).normalized()*knockback)

	move_and_slide()
