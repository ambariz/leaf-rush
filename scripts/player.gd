extends CharacterBody2D

signal score_updated(value)
signal coins_completed

var base_speed := 400.0
var speed := base_speed
var coins := 0

func _physics_process(delta):
	var dir = Input.get_vector("left", "right", "up", "down")
	velocity = dir * speed
	move_and_slide()

func collect_coin():
	coins += 1
	score_updated.emit(coins)

	if coins == 16:
		coins_completed.emit()

func apply_speed_boost():
	print("Speed boosted!")

	speed = 3400

	await get_tree().create_timer(3.0).timeout

	speed = base_speed
	print("Speed back to normal")
