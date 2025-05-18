class_name Player
extends CharacterBody2D

var walkSpeed = 1000.0
var acceleration = 0.2

func _ready():
	Globals.player = self

func _physics_process(delta):
	if Globals.game_won:
		velocity.y = walkSpeed*-1.0
		velocity.x = walkSpeed*-1.0
	else:
		velocity.y = 100.0
		get_input(delta)
	move_and_slide()

func get_input(_delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = lerp(velocity.x, walkSpeed, acceleration)
	elif Input.is_action_pressed("ui_left"):
		velocity.x = lerp(velocity.x, walkSpeed*-1.0, acceleration)
	elif Input.is_action_just_pressed("ui_down"):
		
		var holding_baguette = Globals.getBaguettesInRange()
		
		if Globals.playerOverPond and holding_baguette.size() > 0:
			if Globals.d1LiveLeft < 1 and Globals.d2LiveLeft < 1 and Globals.d3LiveLeft < 1:
				Globals.d1LiveLeft = 100
				Globals.d2LiveLeft = 100
				Globals.d3LiveLeft = 100	
		if holding_baguette:
			for a in holding_baguette:
				a.destroy()
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
