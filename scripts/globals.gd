extends Node

var game_mode : String = "standard"
var speedup_targets : int = 10
var difficulty : int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

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
