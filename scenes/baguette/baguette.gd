class_name Baguette
extends RigidBody2D

var area_collison = false
var has_collide = false
var isInRange = false

func _ready():
	self.rotation_degrees = randf_range(-180.0, 180.0)
	Globals.baguettes.append(self)

func _physics_process(delta):
	var diffX = abs(self.global_position.x - Globals.player.global_position.x)
	var diffY = Globals.player.global_position.y - self.global_position.y
	if diffX < 100 and diffY < 200 and diffY > -10:
		isInRange = true
		var direction = (Globals.player.global_position - self.global_position).normalized()
		direction.y = 0
		self.apply_impulse(direction*1000)
	else:
		isInRange = false

func _on_body_entered(body):
	if body is Ground:
		Globals.baguettes.erase(self)
		get_parent().call_deferred("remove_child", self)
		self.queue_free()
		return

	if has_collide:
		return

	if body is Player:
		body.set_collision_mask_value(3, false)

	if body is Player or body is Baguette:
		has_collide = true
