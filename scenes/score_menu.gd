extends Control

@onready var StandardLabel = $ColorRect/MarginContainer/VBoxContainer/StandardLabel
@onready var ChronoLabel = $ColorRect/MarginContainer/VBoxContainer/ChronoLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	set_labels()

func set_labels():
	StandardLabel.text = "best score standard : " + str(Globals.get_standard())
	ChronoLabel.text = "best score chrono : " + str(Globals.get_chrono())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
