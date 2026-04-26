extends Node

@onready var player = $player
@onready var door = $door
@onready var popup = $UI/popup
@onready var popup_text = $UI/popup/PopupText
@onready var score_label = $UI/ScoreLabel
@onready var main_map = $TileMapLayer
@onready var house_map = $TileMapLayer2
@onready var house_spawn = $HouseSpawn
@onready var house_spawn_exit = $HouseSpawnExit
@onready var win_lable = $UI/WinLabel

func _ready():
	player.score_updated.connect(_on_score_updated)
	player.coins_completed.connect(_on_coins_completed)

func _on_score_updated(value):
	score_label.text = "Coins: " + str(value) + "/16"

func _on_coins_completed():
	print("Coins completed")
	door.unlock()
	show_popup("Door is now open! (click to close)")

func try_open_door():
	print("Door checked")

	if player.coins != 16:
		show_popup("Door Closed, Collect all 16 coins (click to close)")

func show_popup(text):
	print("SHOW POPUP CALLED")

	if popup == null or popup_text == null:
		print("UI PATH WRONG")
		return

	popup.visible = true
	popup_text.text = text

	print("POPUP WORKING")

func enter_house():
	print("Entering house")

	main_map.visible = false
	house_map.visible = true

	player.global_position = house_spawn.global_position


func exit_house():
	print("Exiting house")

	main_map.visible = true
	house_map.visible = false
	player.global_position = house_spawn_exit.global_position

func reset_game():
	get_tree().reload_current_scene()

func game_completed():
	player.set_process(false)
	win_lable.text = "Congratulations!"
	win_lable.visible = true
	await get_tree().create_timer(2.0).timeout
	reset_game()
