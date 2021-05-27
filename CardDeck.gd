extends Control

onready var card = preload("res://Card.tscn")

onready var idx = Array()


func _ready():
	fill_idx()
	shuffle_idx()
	fill()

func fill_idx():
	for i in range (1, 33):
		idx.append(i)
		idx.append(i)
			
func shuffle_idx():
	randomize()
	idx.shuffle()
	
func fill():
	for i in idx:
		var c = card.instance()
		c.init(i)
		$GridContainer.add_child(c)
		
		

	
