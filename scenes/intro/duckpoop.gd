extends CharacterBody2D

func _physics_process(_delta):
	velocity = Vector2(0, 500)
	if position.y < 630:
		move_and_slide()
	else:
		scale.x = 0.5
		scale.y = 0.5
