extends CharacterBody3D
class_name Duck

@export var speed = 125
@export var dir = 1

var died : bool = false

func set_dir(direct):
	dir = direct

func _physics_process(delta):
	if !died:
		velocity.x = ((125 + Globals.get_speedup()) * dir) * delta
		update_animations()
	else:
		velocity.x = 0
		velocity.y = -50 * delta 
	move_and_slide()
	
func update_animations():
	if dir == -1:
		$AnimatedSprite2D.play("duck1_fly_l")
	else:
		$AnimatedSprite2D.play("duck1_fly_r")

func die():
	$AnimatedSprite2D.play("duck1_hit")
	died = true
	$CollisionShape2D.disabled = true
	await get_tree().create_timer(1).timeout
	queue_free()
