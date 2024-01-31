extends CanvasLayer

func _on_button_start_pressed():
	Globals.set_game_mode("standard")
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_btn_quit_pressed():
	Globals.write_scores()
	print(Globals.get_standard())
	print(Globals.get_chrono())
	get_tree().quit()

func _on_btn_chrono_pressed():
	Globals.set_game_mode("chrono")	
	get_tree().change_scene_to_file("res://scenes/game.tscn")
