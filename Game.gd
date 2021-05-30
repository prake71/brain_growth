extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var time_label = get_node("HUD/Panel/Sections/TimerSection/Time")
onready var moves_label = get_node("HUD/Panel/Sections/MovesSection/Moves")
onready var score_label = get_node("HUD/Panel/Sections/ScoreSection/Score")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


func _process(delta):
	update_hud()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func update_hud():
	score_label.text = str(GameManager.score)
	moves_label.text = str(GameManager.moves)
	time_label.text = str(GameManager.playtime)


