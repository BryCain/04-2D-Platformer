extends Area2D

export var score = 10

func _ready():
	pass


func _on_Gem_body_entered(body):
	if body.name == "Player":
		Global.increase_score(score)
		var gem_sound = get_node_or_null("/root/Game/Gem_Sound")
		if gem_sound != null:
			gem_sound.play()
		queue_free()
