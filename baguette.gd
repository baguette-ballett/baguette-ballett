extends RigidBody2D

func _on_player_area_body_entered(body):
	if body.name != "baguette":
		return

	set_deferred("freeze", true)
