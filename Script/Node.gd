extends Node

var grass_scene = preload("res://Scenes/grass.tscn")

var road_scene = preload("res://Scenes/road.tscn")

var to_generate = -6

func _ready():
	while (to_generate < 0):
		var grass = grass_scene.instantiate()
		grass.position = Vector3(0, 0, -to_generate)
		to_generate += 1
		add_child(grass)
	to_generate = 1

func _process(delta):
	while (abs(abs(to_generate) - abs($"../Camera3D".position.z)) < 25):
		var rng = RandomNumberGenerator
		var scene 
		if (randi_range(0, 2) == 2):
			scene = grass_scene.instantiate()
		else:
			scene = road_scene.instantiate()
		scene.position = Vector3(0, 0, -to_generate)
		
		to_generate += 1
		add_child(scene)
		if ("add_trees" in scene):
			scene.add_trees()
