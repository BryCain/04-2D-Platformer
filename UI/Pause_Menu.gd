extends Control

func _on_Quit_pressed():
	get_tree().paused = false
	get_tree().quit()

func _on_Restart_pressed():
	get_tree().paused = false
	Global.reset()
