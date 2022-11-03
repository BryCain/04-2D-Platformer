extends Control


func _ready():
	$Score.text = "Your score was: " + str(Global.score) + " points."


func _on_Quit_pressed():
	get_tree().quit()

func _on_Restart_pressed():
	var _restart = Global.reset()
