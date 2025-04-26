extends Node2D

const L_1 = preload("res://Scenes/Levels/L_1/L_1.tscn")
func _ready():
	GlobalBeings.connect('stopped_moving',Callable(self,'_car_stopped_moving'))

func _car_stopped_moving():
	get_tree().reload_current_scene()


func _on_death_body_entered(body):
	if body.is_in_group('Car') :
		get_tree().reload_current_scene()


func _on_space_2_body_entered(body):
	pass # Replace with function body.
	if body.is_in_group('Car') :
		$space/anim.play("space")
		$space2.queue_free()


func _on_slow_2_body_entered(body):
	if body.is_in_group('Car') :
		$slow/anim.play("space")
		$slow2.queue_free()
	pass # Replace with function body.


func _on_in_body_entered(body):
	if body.is_in_group('Car') :
		body.global_position = $red.global_position
		$Timer.start(0.8)


func _on_timer_timeout():
	pass # Replace with function body.
	get_tree().change_scene_to_packed(L_1)
