extends CharacterBody2D

var walkSpeed = 1000.0

func _physics_process(delta):
	velocity.y = 100.0
	get_input(delta)
	move_and_slide()

func get_input(delta):
	if Input.is_action_pressed("right"):
		#get_node("Sprite").set_flip_h(false)
		#direction.x = 1
		velocity.x = lerp(velocity.x, walkSpeed, 0.3)
	elif Input.is_action_pressed("left"):
		#get_node("Sprite").set_flip_h(true)
		#direction.x = -1
		velocity.x = lerp(velocity.x, walkSpeed*-1.0, 0.3)
	else:
		velocity.x = lerp(velocity.x, 0.0, 0.1)
