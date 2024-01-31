extends Node

var game_mode : String = "standard"
var speedup_targets : int = 10
var difficulty : int = 1
var best_score_standard : int = 0
var best_score_chrono : int = 0
var path_score_standard = "res://scorefolder/score_standard.txt"
var path_score_chrono = "res://scorefolder/score_chrono.txt"

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
	speedup_targets += 50

func get_difficulty():
	return difficulty
	
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

func reset_speedup():
	speedup_targets = 10

func write_scores():
	var standard = FileAccess.open(path_score_standard, FileAccess.WRITE)
	var chrono = FileAccess.open(path_score_chrono, FileAccess.WRITE)
	standard.store_string(str(best_score_standard))
	chrono.store_string(str(best_score_chrono))
	standard.close()
	chrono.close()
