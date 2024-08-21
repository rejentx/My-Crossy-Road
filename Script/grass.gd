extends StaticBody3D

var tree_scene = preload("res://Scenes/tree.tscn")

func add_trees():
	var rng = RandomNumberGenerator.new()
	
	for i in range(randi_range(0, 4)):
		var tree = tree_scene.instantiate()
		
		tree.position = Vector3(0, 0, 0 + randi_range(-5, 5))
		
		tree.scale = Vector3(0.12, 0.12, 0.12)
		
		add_child(tree)
