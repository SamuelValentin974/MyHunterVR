extends Area3D

signal target_escaped

func _on_body_entered(body):
	if body is Duck:
		body.queue_free()
		emit_signal("target_escaped")
