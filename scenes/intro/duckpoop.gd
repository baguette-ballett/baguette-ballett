extends CharacterBody2D

func _physics_process(_delta):	
	velocity = Vector2(0, 500)
	if position.y < 500:
		move_and_slide()
	else:
		get_node("Sprite2D").scale.x = 10
		get_node("Sprite2D").scale.y = 9
