extends Node2D
const LOST = preload("res://FINAle/lost.tscn")
func _ready():
	GlobalBeings.connect('stopped_moving',Callable(self,'_car_stopped_moving'))

func _car_stopped_moving():
	get_tree().reload_current_scene()

func _on_death_body_entered(body):
	if body.name == 'car-1':
		print(body.global_position)
		get_tree().change_scene_to_file("res://FINAle/lost.tscn")

func _input(event):
	if Input.is_action_just_pressed("exit"):get_tree().quit()

##########################################
func _on_area_2d_body_entered(body):
	if body.name == 'car-1':
		body.global_position = $"Blocks/1/2".global_position
func _on_we_body_entered(body):
	if body.name == 'car-1':
		body.global_position = $"Blocks/1/1".global_position
func _on_q_body_entered(body):
	if body.name == 'car-1':
		body.global_position = $"Blocks/3/red".global_position
func _on_w_body_entered(body):
	if body.name == 'car-1':
		body.global_position = $"Blocks/3/red2".global_position
func _on_e_body_entered(body):
	if body.name == 'car-1':
		body.global_position = $"Blocks/4/red".global_position
##########################################


	


func _on_again_body_entered(body):
	if body.name == 'car-1':
		body.global_position = $Lost/out.global_position


func _on_loop_body_entered(body):
	if body.name == 'car-1':
		body.global_position = $Lost/out2.global_position
	pass # Replace with function body.

func _on_loop_2_body_entered(body):
	pass # Replace with function body.
	if body.name == 'car-1':
		body.global_position = $Lost/out.global_position


func _on_end_body_entered(body):
	$Timer.start(6)


func _on_timer_timeout():
	
	pass # Replace with function body.
