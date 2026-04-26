extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		get_parent().exit_house()
