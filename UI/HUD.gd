extends Control


func _ready():
	update_score()
	update_lives()

func update_score():
	$Score.text = "Score: " + str(Global.score)

func update_lives():
	$Lives.text = "Lives: " + str(Global.lives)
