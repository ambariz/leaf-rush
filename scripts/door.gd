extends StaticBody2D

@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D

const CLOSED = preload("res://assets/door-closed.png")
const OPEN = preload("res://assets/door-open.png")

var is_open := false

func _ready():
	sprite.texture = CLOSED

func unlock():
	print("Unlock called")

	sprite.texture = OPEN

	if $CollisionShape2D:
		$CollisionShape2D.set_deferred("disabled", true)
