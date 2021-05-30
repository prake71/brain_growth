extends Control

onready var card = preload("res://Card.tscn")

onready var idx = Array()

onready var deck_covered = true

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
		#c.set_rotation(rand_range(0.0,3.9))
		$GridContainer.add_child(c)
		
		
func show():
	if deck_covered:
		for c in $GridContainer.get_children():
			if !c.get_modulate().a < 1:
				c.flip()
				c.set_disabled(true)
		deck_covered = false
	else:
		for c in $GridContainer.get_children():
			if  !c.get_modulate().a < 1:
				c.flip()
				c.set_disabled(false)
		deck_covered = true	

func reset():
	for c in $GridContainer.get_children():
		c.queue_free()
	idx.clear()
	fill_idx()
	shuffle_idx()
	fill()

func _on_ShowButton_pressed():
	show()



func _on_ResetButton_pressed():
	reset()
	GameManager.reset()
