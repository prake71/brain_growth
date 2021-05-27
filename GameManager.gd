extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var card1 = null
var card2 = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func choose_card(var c):
	if card1 == null:
		card1 = c
		card1.flip()
		card1.set_disabled(true)
	elif card2 == null:
		card2 = c
		card2.flip()
		card2.set_disabled(true)
		check_cards()
		
func check_cards():
	print("in check_cards()")
	if card1.value == card2.value:
		$MatchTimer.start()	
	else:
		$FlipTimer.start()

func _on_FlipTimer_timeout():
	# flip cards back
	card1.flip()
	card2.flip()
	card1.set_disabled(false)
	card2.set_disabled(false)
	card1 = null
	card2 = null

func _on_MatchTimer_timeout():
	# cards stay disabled
	card1.set_modulate(Color(0.6, 0.6, 0.6, 0.5))
	card2.set_modulate(Color(0.6, 0.6, 0.6, 0.5))
	card1 = null
	card2 = null

