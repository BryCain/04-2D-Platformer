extends Node2D

onready var Enemy1 = load("res://Enemies/Enemy1.tscn")
onready var Enemy2 = load("res://Enemies/Enemy2.tscn")

func _process(_delta):
	if not has_node("Enemy1"):
		var enemy1 = Enemy1.instance()
		enemy1.name = "Enemy1"
		add_child(enemy1)
	if not has_node("Enemy2"):
		var enemy2 = Enemy2.instance()
		enemy2.name = "Enemy2"
		add_child(enemy2)
