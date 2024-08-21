extends StaticBody3D

var availible_scenes = [preload("res://Scenes/car_1.tscn"), preload("res://Scenes/car_2.tscn"), preload("res://Scenes/car_3.tscn")]

var speed 

var direction 

func _ready():
	var rng = RandomNumberGenerator.new()
	speed = rng.randi_range(5, 20)
	direction = rng.randi_range(0, 1)
	if (direction == 0):
		direction = -1
	$Timer.wait_time = rng.randi_range(1, 5)
	
func _on_timer_timeout():
	var rng = RandomNumberGenerator.new()
	$Timer.wait_time = rng.randi_range(1, 5)
	var car = availible_scenes[rng.randi_range(0, 2)].instantiate()
	car.speed = speed
	car.direction = direction 
	if direction == -1:
		car.position = Vector3(20, 0, 0)
	if direction == 1:
		car.position = Vector3(-20, 0, 0)
	add_child(car)
