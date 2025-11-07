extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().create_timer(0.15).timeout.connect(func():
		queue_free())
