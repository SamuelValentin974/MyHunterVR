extends Node3D

@onready var spawner_left = $SpawnPosLeft
@onready var spawner_right = $SpawnPosRight

var side : int = 1

var targets = preload("res://scenes/target_range.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_spawn_timer_timeout():
	side = randi_range(0, 1)
	if (side == 0) :
		side = -1
	spawn_enemy()

func spawn_enemy():
	var spawn_pos
	if side == 1:
		spawn_pos = spawner_left.get_children().pick_random()
	else:
		spawn_pos = spawner_right.get_children().pick_random()
	var target_instance : TargetRange = targets.instantiate()
	target_instance.global_position	= spawn_pos.global_position
	target_instance.set_dir(side)
	target_instance.set_rotation(Vector3(0,90,0))
	add_child(target_instance)
