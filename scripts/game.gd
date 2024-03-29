extends Node3D

@export var game : bool

var score : int = 0

var time_left : int = Globals.get_time_chrono()

var xr_interface: XRInterface

func _ready():
	randomize()
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialized successfully")
		# Turn off v-sync!
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		# Change our main viewport to output to the HMD
		get_viewport().use_xr = true
		$Player.set_in_game(game)
		change_rule()
	else:
		print("OpenXR not initialized, please check if your headset is connected")

func change_rule():
	Globals.set_rule.emit()
	print("Gamemode = ", Globals.get_game_mode())
	if Globals.get_game_mode() == "chrono":
		$Timers/TimerChronoMode.start()

func _on_timer_chrono_mode_timeout():
	time_left -= 1
	Globals.time_decreased.emit(time_left)
	if time_left <= 0:
		Globals.set_game_mode("menu")
		Globals.compare_scores(Globals.get_standard(), score)	
		Globals.reset_speedup()	
		Globals.reset_score()
		get_tree().change_scene_to_file("res://assets/world.tscn")

func _on_pistol_hit_target():
	$ScoreUp.play()
	score += 10
	Globals.set_current_score(score)

func _on_timer_add_level_timeout():
	Globals.inc_speed()
	print("speed = ", Globals.get_speedup())

func _on_boundary_target_escaped():
	if Globals.get_game_mode() == "standard":
		Globals.dec_life()
		if Globals.get_lives() < 1:
			Globals.set_game_mode("menu")
			Globals.compare_scores(score, Globals.get_chrono())
			Globals.reset_speedup()
			Globals.reset_score()
			get_tree().change_scene_to_file("res://assets/world.tscn")
