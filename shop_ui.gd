extends Control
@onready var ammo = $AMMO/Button
@onready var health = $HEALTH/Button2
@onready var player = $"../.."
signal ammoup
signal healthup

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#ammo
func _on_button_button_down() -> void:
	ammoup.emit()
#health
func _on_button_2_button_down() -> void:
	healthup.emit()
