extends RigidBody2D

func _on_baguette_area_entered(body):
	if body.name != "player" and body.name != 'baguette':
		return

	var other = body
	var baguette = self

	var joint1 = PinJoint2D.new()
	joint1.node_a = other.get_path()
	joint1.node_b = baguette.get_path()
	joint1.position = baguette.global_position
	get_tree().current_scene.add_child(joint1)
