extends Node2D

const L_1 = preload("res://Scenes/Levels/Trial/trial.tscn")
@onready var anim = $anim

func _input(event):
	if Input.is_action_just_pressed("dash"):
		anim.play('en')
		$Timer.start(0.80)
		


func _on_timer_timeout():
	get_tree().change_scene_to_packed(L_1)
