extends Area2D


var speed = 8000

func _physics_process(delta):
	position += transform.x * speed * delta
	


func _on_body_entered(body: Node2D) -> void:
	pass
	#queue_free()


func _on_timer_timeout() -> void:
	queue_free()
