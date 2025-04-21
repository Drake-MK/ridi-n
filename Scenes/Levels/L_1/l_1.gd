extends Node2D

@onready var anim = $anim
@onready var _2 = $"Blocks/2"

var next_scene = preload("res://Scenes/Levels/l_2/l_2.tscn")

func _ready():
	anim.play("st")
	GlobalBeings.connect('stopped_moving',Callable(self,'_car_stopped_moving'))

func _on_in_body_entered(body):
	if body.is_in_group('Car'):
		body.global_position = _2.global_position


func _on_in_3_body_entered(body):
	
	if body.is_in_group('Car'):
		body.global_position = $"Blocks/4".global_position


func _on_death_body_entered(body):
	get_tree().reload_current_scene()

func _car_stopped_moving():
	get_tree().reload_current_scene()

func _input(event):
	if Input.is_action_just_pressed('exit'):get_tree().quit()


	

func _on_timer_timeout():
	pass # Replace with function body.
	get_tree().change_scene_to_file("res://Scenes/Levels/l_2/l_2.tscn")


func _on_next_body_entered(body):
	if body.name == 'car-1':
		anim.play("en")
		print('goinf to l2')
		$Timer.start(1)
