extends Node3D

var in_game : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if in_game:
		$XROrigin3D/LeftHand/FunctionPointer/Laser.visible = false
		$XROrigin3D/RightHand/FunctionPointer/Laser.visible = false
	else:
		$XROrigin3D/LeftHand/FunctionPointer/Laser.visible = true
		$XROrigin3D/RightHand/FunctionPointer/Laser.visible = true

func set_in_game(ing):
	in_game = ing
