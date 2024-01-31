extends CharacterBody3D
class_name TargetRange

@export var speed = 125
@export var dir = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_dir(direct):
	dir = direct
	
func _physics_process(delta):
	velocity.x = ((125 + Globals.get_speedup()) * dir) * delta
	move_and_slide()
