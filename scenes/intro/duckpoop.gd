extends CharacterBody2D

func _physics_process(delta):
	velocity = Vector2(0, 300)
	move_and_slide()
