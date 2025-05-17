extends Node2D

@export var baguettes: PackedScene

func _process(delta):
	if Input.is_action_pressed("ui_r_key"):
		get_tree().reload_current_scene()

func _on_spawn_timer_timeout():
	var baguette = baguettes.instantiate()
	var location = get_node("SpawnArea/SpawnAreaLocation")
	location.progress_ratio = randf()
	
	baguette.position = location.position

	var direction = randf_range(-PI / 8, PI / 8)
	baguette.rotation = direction
	var velocity = Vector2(randf_range(200.0, 1000.0), -700.0)
	baguette.linear_velocity = velocity.rotated(direction)

	add_child(baguette)
