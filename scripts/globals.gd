extends Node

signal score_changed
signal life_dec
signal time_decreased(timeleft)
signal set_rule()
signal spawn_time_changed
signal level_inc

var life : int  = 5
var game_mode : String = "menu"
var speedup_targets : int = 10
var difficulty : int = 1
var best_score_standard : int = 0
var best_score_chrono : int = 0
var path_score_standard = "res://scorefolder/score_standard.txt"
var path_score_chrono = "res://scorefolder/score_chrono.txt"
var current_score : int = 0
var time_chrono = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	load_scores()
	print(best_score_standard)
	print(best_score_chrono)
	
func load_scores():
	var standard = FileAccess.open(path_score_standard, FileAccess.READ)
	var chrono = FileAccess.open(path_score_chrono, FileAccess.READ)
	best_score_standard = int(standard.get_as_text())
	best_score_chrono = int(chrono.get_as_text())
	standard.close()
	chrono.close()

func set_game_mode(mode):
	game_mode = mode

func get_game_mode():
	return game_mode

func inc_speed():
	difficulty += 1
	level_inc.emit()
	speedup_targets = 50 * difficulty
	if difficulty % 3 == 0 && difficulty <= 12:
		spawn_time_changed.emit()

func get_difficulty():
	return difficulty

func inc_difficulty():
	difficulty += 1

func dec_difficulty():
	difficulty -= 1

func get_lives():
	return life

func dec_life():
	life -= 1
	life_dec.emit()
	
func get_speedup():
	return speedup_targets

func compare_scores(standard, chrono):
	if standard > best_score_standard:
		best_score_standard = standard
	if chrono > best_score_chrono:
		best_score_chrono = chrono

func get_chrono():
	return best_score_chrono

func get_standard():
	return best_score_standard
	
func get_current_score():
	return current_score
	
func set_current_score(score):
	current_score = score
	emit_signal("score_changed")
	
func get_time_chrono():
	return time_chrono

func set_time_chrono(chrono):
	time_chrono = chrono

func reset_score():
	current_score = 0

func reset_speedup():
	speedup_targets = 10

func write_scores():
	var standard = FileAccess.open(path_score_standard, FileAccess.WRITE)
	var chrono = FileAccess.open(path_score_chrono, FileAccess.WRITE)
	standard.store_string(str(best_score_standard))
	chrono.store_string(str(best_score_chrono))
	standard.close()
	chrono.close()
