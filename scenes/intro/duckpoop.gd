extends CharacterBody2D

var shitIsFalling = true
var shittingHasBeenStarted = false

func _physics_process(_delta):
	if shitIsFalling == true:
		velocity = Vector2(0, 500)
		if position.y > -100 and not shittingHasBeenStarted:
			get_node("duckShits").play()
			shittingHasBeenStarted = true
		if position.y < 828:
			move_and_slide()
		else:
			get_node("shitHitsTheSign").play()
			get_node("Sprite2D").scale.x = 8
			get_node("Sprite2D").scale.y = 6
			shitIsFalling = false
