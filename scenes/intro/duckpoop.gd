extends CharacterBody2D

func _physics_process(_delta):
	velocity = Vector2(0, 300)
	if position.y < 455:
		move_and_slide()
	
