extends CanvasLayer

var score_label : Label
var timer_label : Label
var life_label : Label
var timer : Timer
var elapsed_time : float = 0.0

var game_mode : String

# Called when the node enters the scene tree for the first time.
func _ready():
	score_label = $Score
	timer_label = $LTimer
	life_label = $Life
	timer = $Timer


	update_score(0)
	update_life(5)
	
	#timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	elapsed_time += delta

	if game_mode == "chrono_mode":
		timer_label.visible = true
		life_label.visible = false
	elif game_mode == "standard_mode":
		timer_label.visible = false
		life_label.visible = true
	
	#update_timer()
	


func update_score(score):
	score_label.text = "Score: " + str(score)

func update_timer():
	timer_label.text = "Timer: " + str(int(elapsed_time))

func update_life(lives):
	life_label.text = "Lives: " + str(lives)


func _on_timer_timeout():
	pass # Replace with function body.
