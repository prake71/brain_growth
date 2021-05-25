extends TextureButton


var value
var face = preload("res://assets/cards/card-1.png")
var back = preload("res://assets/cards/card-back.png")
var face_up = false


func init(var v=1):
	value = v
	face = load("res://assets/cards/card-" + str(value) + ".png")
	

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _pressed():
	if get_normal_texture() == back:
		set_normal_texture(face)
		face_up = true
	else:
		set_normal_texture(back)
		face_up = false
		
