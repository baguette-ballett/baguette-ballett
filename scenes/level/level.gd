extends Node2D

@export var baguettes: PackedScene

func _process(delta):
	if Input.is_action_pressed("ui_r_key"):
		get_tree().reload_current_scene()
	if Globals.game_won:
		$Duckling1.flip_h = false
		$Duckling1.translate(Vector2(-10,-10))
		$Duckling2.translate(Vector2(-10,-10))
		$Duckling3.translate(Vector2(-10,-10))

func _on_spawn_timer_timeout():
	var baguette = baguettes.instantiate()
	var location = get_node("SpawnArea/SpawnAreaLocation")
	location.progress_ratio = randf()
	
	baguette.position = location.position

	baguette.rotation = randf_range(-PI / 4, PI / 4)
	var velocity = Vector2(1, -1) * randf_range(200, 1000)
	baguette.linear_velocity = velocity.rotated(randf_range(-PI / 8, 0))

	add_child(baguette)
