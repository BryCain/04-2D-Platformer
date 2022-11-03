extends Area2D


func _ready():
	pass


func _on_Flag_body_entered(body):
	if body.name == "Player":
		var _end = get_tree().change_scene("res://UI/End_Game.tscn")
