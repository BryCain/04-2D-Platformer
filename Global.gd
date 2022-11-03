extends Node

var score = 0
var lives = 5
var level = 1

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS

func _unhandled_input(_event):
	if Input.is_action_pressed("menu"):
		var Pause_Menu = get_node_or_null("/root/Game/UI/Pause_Menu")
		if Pause_Menu == null:
			get_tree().quit()
		else:
			if Pause_Menu.visible:
				get_tree().paused = false
				Pause_Menu.hide()
			else:
				get_tree().paused = true
				Pause_Menu.show()
	if lives < 0:
		var _GameOver = get_tree().change_scene("res://UI/GameOver.tscn")

func increase_score(s):
	score += s
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_score()

func lose_life(l):
	lives -= l
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_lives()

func reset():
	score = 0
	lives = 5
	level = 1
	var _restart = get_tree().change_scene("res://Levels/Level1.tscn")
