extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		get_tree().current_scene.try_open_door()
