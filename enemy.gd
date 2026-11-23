extends CharacterBody2D

const SPEED: float = 75.0

func _physics_process(delta: float) -> void:
	
	
	move_and_slide()



func _on_area_2d_area_entered(area: Area2D) -> void:
		print("HIT")
		if area.is_in_group("bullet"):
			print("HIT")
			queue_free()
