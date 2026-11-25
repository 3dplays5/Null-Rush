extends CharacterBody2D
@onready var player = $"../../../player"
var speed = randf_range(150, 200)

func _physics_process(delta: float) -> void:
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
		if area.is_in_group("bullet"):
			queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("bullet"):
		body.queue_free()
		queue_free()
	if body.is_in_group("player"):
		body.health -= 25
		print(body.health)

		
