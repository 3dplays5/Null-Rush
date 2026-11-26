extends CharacterBody2D

@onready var text = $Label
var entered = false
func _ready() -> void:
	text.text = "SHOP"


func _physics_process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		text.text = "PRESS E TO OPEN SHOP"
		entered = true
		body.shop()


func _on_area_2d_body_exited(body: ) -> void:
	if body.is_in_group("player"):
		entered = false
		body.shopexit()
