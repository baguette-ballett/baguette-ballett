class_name Player
extends CharacterBody2D

var walkSpeed = 1000.0
var acceleration = 0.2

func _ready():
	Globals.player = self

func _physics_process(delta):
	velocity.y = 100.0
	get_input(delta)
	move_and_slide()

func get_input(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = lerp(velocity.x, walkSpeed, acceleration)
	elif Input.is_action_pressed("ui_left"):
		velocity.x = lerp(velocity.x, walkSpeed*-1.0, acceleration)
	elif Input.is_action_just_pressed("ui_down"):
		print("Drop Bread")
	else:
		velocity.x = lerp(velocity.x, 0.0, 0.1)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if !(body is Player):
		return
	Globals.setPlayrOverPond(true)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if !(body is Player):
		return
	Globals.setPlayrOverPond(false)
