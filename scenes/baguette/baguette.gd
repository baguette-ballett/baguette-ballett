extends RigidBody2D

func _ready():
	self.rotation_degrees = randf_range(-180.0, 180.0)

func _on_baguette_area_entered(body):
	if body.name == "ground body":
		get_parent().remove_child(self)
		self.queue_free()

	if body.name != "player" and body.name != 'baguette':
		return

	var other = body
	var baguette = self

	var joint1 = PinJoint2D.new()
	joint1.node_a = other.get_path()
	joint1.node_b = baguette.get_path()
	joint1.position = baguette.global_position
	get_tree().current_scene.add_child(joint1)
