extends Control


func _ready():
	pass

func _on_Quit_pressed():
	get_tree().quit()

func _on_Play_pressed():
	Global.reset()
