
extends RigidBody2D

var area_collison = false
var has_collide = false

func _ready():
		self.rotation_degrees = randf_range(-180.0, 180.0)

func _on_baguette_area_entered(body):
		if has_collide or body.name == "ground body" or body.name == self.name:
				return
				
		#has_collide = true
		var other = body
		var baguette = self
		print(body.name)
		print(self.name)
		var joint1 = PinJoint2D.new()
		joint1.node_a = other.get_path()
		joint1.node_b = baguette.get_path()
		joint1.position = baguette.global_position
		get_tree().current_scene.add_child(joint1)
		has_collide = true
