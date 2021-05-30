extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var play = load("res://assets/ui/play.png")
onready var pause = load("res://assets/ui/pause.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _pressed():
	if get_tree().paused == false:
		get_tree().paused = true
		set_normal_texture(play)
	else:
		get_tree().paused = false
		set_normal_texture(pause)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
