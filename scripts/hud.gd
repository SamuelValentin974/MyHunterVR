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
	Globals.score_changed.connect(_on_score_change)
	Globals.life_dec.connect(_on_life_change)
	Globals.time_decreased.connect(_on_time_decreased)
	Globals.set_rule.connect(change_label)
	update_score()
	update_life(5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	elapsed_time += delta

func change_label():
	if Globals.get_game_mode() == "chrono":
		timer_label.visible = true
		life_label.visible = false
	elif Globals.get_game_mode() == "standard":
		timer_label.visible = false
		life_label.visible = true
		update_timer(Globals.get_time_chrono())

func _on_time_decreased(time_left):
	update_timer(time_left)
	
func _on_score_change():
	update_score()

func _on_life_change():
	update_life(Globals.get_lives())

func update_score():
	score_label.text = "Score: " + str(Globals.get_current_score())

func update_timer(time):
	timer_label.text = "Timer: " + str(int(time))

func update_life(lives):
	life_label.text = "Lives: " + str(lives)

func _on_timer_timeout():
	pass # Replace with function body.
