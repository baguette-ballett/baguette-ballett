class_name Baguette
extends RigidBody2D

var area_collison = false
var has_collide = false

func _ready():
	self.rotation_degrees = randf_range(-180.0, 180.0)

func _physics_process(delta):
	if abs(self.global_position.x - Globals.player.global_position.x) < 50:
		var direction = (Globals.player.global_position - self.global_position).normalized()
		direction.y = 0
		self.apply_impulse(direction*1000)

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
		has_collide = true
