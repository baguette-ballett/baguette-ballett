extends Node2D

func _physics_process(_delta):
	if (Input.is_key_pressed(KEY_ENTER)):
		get_tree().change_scene_to_file("res://scenes/level/level.tscn")
