extends Area3D
class_name car

var speed = 0

var direction = 0

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed * delta * direction


func _on_timer_timeout():
	queue_free()


func _on_body_entered(body):
	if "hit" in body:
		body.hit()
