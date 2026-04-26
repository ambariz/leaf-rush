extends Area2D

func _ready():
	add_to_group("coins")

func _on_body_entered(body):
	if body.name == "player":
		body.collect_coin()
		queue_free()
