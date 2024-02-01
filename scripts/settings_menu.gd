extends Control

signal back_menu



func _on_btn_back_pressed():
	emit_signal("back_menu")
