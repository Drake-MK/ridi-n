extends AudioStreamPlayer2D
const FIRST = preload("res://Assets/First Love - Sad & Emotional Piano Song Instrumental.mp3")
@onready var io = $"."
func _ready():
	io.playing = true
	var a = FIRST.instantiate_playback()
	add_child(a)
