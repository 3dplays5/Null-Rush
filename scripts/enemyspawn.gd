extends Marker2D

var enemy = preload("res://scenes/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var spawn = enemy.instantiate()
	add_child(spawn)
	spawn.transform = self.transform


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var spawn = enemy.instantiate()
	add_child(spawn)
	spawn.transform = self.transform
