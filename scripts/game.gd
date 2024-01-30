extends Node3D

@export var game : bool = false

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
	else:
		print("OpenXR not initialized, please check if your headset is connected")
