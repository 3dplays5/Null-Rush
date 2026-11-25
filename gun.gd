extends Area2D
var bullets = 12
var maxbullets = 12
var reserve = 120


var bullet = preload("res://bullet.tscn")
@onready var sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if global_rotation_degrees < 90 && global_rotation_degrees > -90:
		sprite.flip_v = false
	else:
		sprite.flip_v = true
	
	if Input.is_action_just_pressed("fire") && bullets > 0:
		fire()
		bullets -= 1
	if Input.is_action_just_pressed("reload"):
		await get_tree().create_timer(0.6).timeout
		while bullets != maxbullets:
			bullets += 1
			reserve -= 1
		


func fire():
	var b = bullet.instantiate()
	owner.owner.add_child(b)
	b.transform = $Marker2D.global_transform
