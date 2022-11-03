extends KinematicBody2D

var start_position = Vector2(960,896)
var player = null
var nav = null
var speed = 40
export var damage = 1

func _ready():
	position = start_position

func _physics_process(_delta):
	nav = get_node_or_null("/root/Game/Navigation2D")
	player = get_node_or_null("/root/Game/Player_Container/Player")
	if nav != null and player != null:
		var points = nav.get_simple_path(global_position, player.global_position, true)
		if points.size() > 1:
			var target = points[1] - global_position
			var s = speed
			if target.length() > s:
				s = target.length()
			if abs(s) < 1:
				s = 0
			var direction = target.normalized()
			if direction.x < 0:
				$AnimatedSprite.flip_h = false
			else:
				$AnimatedSprite.flip_h = true
			var _v = move_and_slide(direction*s, Vector2.ZERO)

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		var die_sound = get_node_or_null("/root/Game/Die_Sound")
		if die_sound != null:
			die_sound.play()
			Global.lose_life(damage)
			body.queue_free()
			queue_free()
