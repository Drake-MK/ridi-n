extends Node2D

@onready var _2 = $"Blocks/2"
@onready var anim = $anim
var L_1 = preload("res://Scenes/Levels/L_1/L_1.tscn")

func _ready():
	anim.play("st")
	GlobalBeings.connect('stopped_moving',Callable(self,'_car_stopped_moving'))

func _on_in_body_entered(body):
	if body.is_in_group('Car'):
		body.global_position = _2.global_position




func _car_stopped_moving():
	get_tree().reload_current_scene()

func _input(event):
	if Input.is_action_just_pressed('exit'):get_tree().quit()

func change_scene():
	get_tree().change_scene_to_packed(L_1)
	pass # Replace with function body.



func _on_in_3_body_entered(body):
	if body.is_in_group('car'):
		body.global_position = $"Blocks/4".global_position
		

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/Levels/L_1/L_1.tscn")


func _on_death_body_entered(body):
	get_tree().reload_current_scene()


func _on_next_body_entered(body):
	if body.is_in_group('Car'):
		
		$Timer.start(1)
		print('going to 1')
		anim.play("en")
