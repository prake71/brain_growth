extends Node2D

onready var game = get_node('/root/Game/')

const NUM_PAIRS = 32
const MAX_TIME = 600
#onready var time_label = game.get_node("HUD/Panel/Sections/TimerSection/Time")
#onready var moves_label = game.get_node("HUD/Panel/Sections/MovesSection/Moves")
#onready var score_label = game.get_node("HUD/Panel/Sections/ScoreSection/Score")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var card1 = null
var card2 = null

var moves = 0
var score = 0
var playtime = 0
var matches = 0

var deck_uncovered = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$PlayTimer.start()

func reset():
	moves = 0
	playtime = 0
	score = 0
	matches = 0

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
	moves += 1
		
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
	score += 1
	matches += 1
	card1.set_modulate(Color(0.6, 0.6, 0.6, 0.5))
	card2.set_modulate(Color(0.6, 0.6, 0.6, 0.5))
	card1 = null
	card2 = null

func _on_PlayTimer_timeout():
	playtime += 1
	if playtime >= MAX_TIME:
		game_over()
	

func game_over():
	if (matches == NUM_PAIRS) and (playtime < MAX_TIME):
		
		
		print("You won!")
	else:
		print("You lose!")
		
		# show game over or win screen
		pass
		


