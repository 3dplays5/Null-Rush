extends Area2D

var bullet = preload("res://bullet.tscn")
@onready var sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if global_rotation_degrees < 90 && global_rotation_degrees > -90:
		sprite.flip_v = false
	else:
		sprite.flip_v = true
	
	if Input.is_action_pressed("fire"):
		fire()
		
func fire():
	var b = bullet.instantiate()
	owner.owner.add_child(b)
	b.transform = $Marker2D.global_transform
