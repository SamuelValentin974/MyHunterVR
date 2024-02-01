extends "res://addons/godot-xr-tools/objects/pickable.gd"
class_name Pistol

signal hit_target

@onready var aim = $Aim
@onready var dot = $Aim/TargetDot

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if aim.is_colliding():
		dot.global_transform.origin = aim.get_collision_point()
		dot.visible = true

func _on_action_pressed(pickable):
	$Shot.play()
	if aim.is_colliding():
		var obj = aim.get_collider()
		if obj is Duck:
			obj.die()
			emit_signal("hit_target")
