extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		body.apply_speed_boost()
		queue_free()
