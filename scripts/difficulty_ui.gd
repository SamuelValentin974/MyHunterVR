extends CanvasLayer
 
@onready var NbLabel = $Difficulty/ColorRect/MarginContainer/VBoxContainer/LabelNb

# Called when the node enters the scene tree for the first time.
func _ready():
	update_label() # Replace with function body.

func update_label():
	NbLabel.text = str(Globals.get_difficulty())

func _on_btn_minus_pressed():
	Globals.dec_difficulty()
	update_label()

func _on_btn_plus_pressed():
	Globals.inc_difficulty()
	update_label()	
