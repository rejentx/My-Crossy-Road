extends CharacterBody3D

signal reload 

var can_walk = true

func _physics_process(delta):

	if (Input.is_action_just_pressed("forward")):
		var tween = get_tree().create_tween()
		if (can_walk):
			animation()
			$AnimationPlayer.play("Jump")
			tween.tween_property($".", "position", position + Vector3(0, 0, -1), 0.15).set_trans(Tween.TRANS_BACK)
			rotation.y = PI

	if (Input.is_action_just_pressed("back")):
		var tween = get_tree().create_tween()
		if (can_walk):
			animation()
			rotation.y = 0
			$AnimationPlayer.play("Jump")
			tween.tween_property($".", "position", position + Vector3(0, 0, 1), 0.15).set_trans(Tween.TRANS_BACK)
			await tween.finished
	if (Input.is_action_just_pressed("left")):
		var tween = get_tree().create_tween()
		if (can_walk):
			animation()
			rotation.y = -PI / 2
			$AnimationPlayer.play("Jump")
			tween.tween_property($".", "position", position + Vector3(-1, 0, 0), 0.15).set_trans(Tween.TRANS_BACK)
			await tween.finished
	if (Input.is_action_just_pressed("right")):
		var tween = get_tree().create_tween()
		if (can_walk):
			animation()
			rotation.y = PI / 2
			$AnimationPlayer.play("Jump")
			tween.tween_property($".", "position", position + Vector3(1, 0, 0), 0.15).set_trans(Tween.TRANS_BACK)
			await tween.finished

func hit():
	reload.emit()


func animation():
	can_walk = false
	$Timer.start()



func _on_visible_on_screen_notifier_3d_screen_exited():
	hit()


func _on_timer_timeout():
	can_walk = true
