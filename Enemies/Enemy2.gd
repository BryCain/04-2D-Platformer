extends KinematicBody2D

export var constraint_left = Vector2(1792,905)
export var constraint_right = Vector2(2240,905)
export var speed = 3
export var damage = 1

func _ready():
	pass

func _physics_process(_delta):
	if not $Tween.is_active():
		var constraint = constraint_left
		$AnimatedSprite.flip_h = false
		if position != constraint_right:
			constraint = constraint_right
			$AnimatedSprite.flip_h = true
		$Tween.interpolate_property(self, "position", position, constraint, speed, Tween.TRANS_EXPO, Tween.EASE_IN)
		$Tween.start()

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		var die_sound = get_node_or_null("/root/Game/Die_Sound")
		if die_sound != null:
			die_sound.play()
			Global.lose_life(damage)
			body.queue_free()
