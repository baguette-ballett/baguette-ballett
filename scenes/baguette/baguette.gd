class_name Baguette
extends RigidBody2D

var area_collison = false
var has_collide = false

func _ready():
	self.rotation_degrees = randf_range(-180.0, 180.0)

func _on_body_entered(body):
	if body is Ground:
		get_parent().call_deferred("remove_child", self)
		self.queue_free()
		return

	if has_collide:
		return

	if body is Player:
		body.set_collision_mask_value(3, false)

	if body is Player or body is Baguette:
		var joint = PinJoint2D.new()
		joint.node_a = body.get_path()
		joint.node_b = self.get_path()
		joint.position = self.global_position
		Globals.jointBaguettes.append(joint)
		get_tree().current_scene.add_child(joint)
		has_collide = true
