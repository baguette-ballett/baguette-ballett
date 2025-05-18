extends Node2D

var d1LiveLeft = 100
var d2LiveLeft = 100
var d3LiveLeft = 100

@export var baguettes: PackedScene

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/intro/intro.tscn")
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

func _on_duckling_dead_timer_timeout():
	var d1 = get_node("Duckling1")
	var d2 = get_node("Duckling2")
	var d3 = get_node("Duckling3")
	d1.modulate = Color(d1LiveLeft/10, 0, 0)
	d2.modulate = Color(d2LiveLeft/10, 0, 0)
	d3.modulate = Color(d3LiveLeft/10, 0, 0)
	if d1LiveLeft < 0:
		d1.rotation = PI
		d1.stop()
	if d2LiveLeft < 0:
		d2.rotation = PI
		d2.stop()
	if d3LiveLeft < 0:
		d3.rotation = PI
		d3.stop()
	d1LiveLeft -= 10
	d2LiveLeft -= 10
	d3LiveLeft -= 10


func _on_game_end_timer_timeout():
	Globals.game_won = true
