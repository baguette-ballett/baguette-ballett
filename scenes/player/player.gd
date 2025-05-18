class_name Player
extends CharacterBody2D

var walkSpeed = 1000.0

func _ready():
	Globals.player = self

func _physics_process(delta):
	velocity.y = 100.0
	get_input(delta)
	move_and_slide()

func get_input(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = lerp(velocity.x, walkSpeed, 0.3)
	elif Input.is_action_pressed("ui_left"):
		velocity.x = lerp(velocity.x, walkSpeed*-1.0, 0.3)
	else:
		velocity.x = lerp(velocity.x, 0.0, 0.1)
