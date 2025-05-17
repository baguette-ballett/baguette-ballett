extends RigidBody2D

var area_collison = false
var has_collide = false

func _ready():
	self.rotation_degrees = randf_range(-180.0, 180.0)

func _on_baguette_area_entered(body):
	if body.name == "ground body":
		get_parent().remove_child(self)
		self.queue_free()
		return
		
	if has_collide or body.name == self.name:
		return

	var joint = PinJoint2D.new()
	joint.node_a = body.get_path()
	joint.node_b = self.get_path()
	joint.position = self.global_position
	get_tree().current_scene.add_child(joint)
	has_collide = true
