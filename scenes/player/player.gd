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
		if not Globals.playerOverPond:
			return

		var balancedBaguettes = Globals.getBaguettesInRange()
		for b in balancedBaguettes:
			b.destroy()
			var ids = [0, 1, 2]
			ids.shuffle()
			for id in ids:
				if Globals.ducklingsLifeLeft[id] < 100 and Globals.ducklingsLifeLeft[id] >= 1:
					Globals.ducklingsLifeLeft[id] = 100
					break
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
