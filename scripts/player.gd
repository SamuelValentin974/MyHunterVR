extends Node3D

var lives : int = 5

func set_in_game(ing):
		$XROrigin3D/LeftHand/FunctionPointer/Laser.visible = ing
		$XROrigin3D/RightHand/FunctionPointer/Laser.visible = ing

func get_lives():
	return lives
	
func dec_lives():
	lives -= 1
