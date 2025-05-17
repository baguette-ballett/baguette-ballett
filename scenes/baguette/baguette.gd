extends RigidBody2D

func _on_player_area_body_entered(body):
	if body.name != "baguette":
		return

	var player = get_parent().get_node("player")
	var baguette = body

	var joint1 = PinJoint2D.new()
	joint1.node_a = player.get_path()
	joint1.node_b = baguette.get_path()
	joint1.position = baguette.global_position
	get_tree().current_scene.add_child(joint1)
