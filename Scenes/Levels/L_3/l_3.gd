extends Node2D

@onready var anim = $anim
const L_1 = preload("res://Scenes/Levels/L_4/L_4.tscn")
func _ready():
	GlobalBeings.connect('stopped_moving',Callable(self,'_car_stopped_moving'))
	anim.play("st")
	
	
func _on_in_1_body_entered(body):
	if body.is_in_group('Car') :
		body.global_position = $Blocks/A/red.global_position


func _on_in_2_body_entered(body):
	if body.is_in_group('Car') :
		body.global_position = $Blocks/B/red.global_position

func _car_stopped_moving():
	get_tree().reload_current_scene()


func _on_death_body_entered(body):
	get_tree().reload_current_scene()


func _on_area_2d_body_entered(body):
	if body.is_in_group('Car') :
		anim.play("en")
		$NEXT.start(3)
		


func _on_next_timeout():
	get_tree().change_scene_to_packed(L_1)
	pass # Replace with function body.
