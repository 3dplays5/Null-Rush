extends CharacterBody2D
@onready var player = $"../../../player"
var speed = randf_range(150, 200)

func _physics_process(delta: float) -> void:
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()



func _on_area_2d_area_entered(area: Area2D) -> void:
		print("HIT")
		if area.is_in_group("bullet"):
			print("HIT")
			queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
		print("HIT")
		if body.is_in_group("bullet"):
			print("HIT")
			body.queue_free()
			queue_free()
