extends CharacterBody2D
var dmg = 1
@onready var gun = $gun
@onready var ammo = $CanvasLayer/Control/ammo
@onready var healthLabel = $CanvasLayer/Control/healthLabel
var health: int = 100
const SPEED = 500.0
const JUMP_VELOCITY = -400.0
@onready var shopui = $"CanvasLayer/shop UI"

func _ready() -> void:
	shopui.hide()

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("W"):
		velocity.y = -SPEED
	elif Input.is_action_pressed("S"):
		velocity.y = SPEED
	else:
		velocity.y = 0
	if Input.is_action_pressed("A"):
		velocity.x = -SPEED
	elif Input.is_action_pressed("D"):
		velocity.x = SPEED
	else:
		velocity.x = 0
	if health <= 0:
		death()
	
	move_and_slide()
	
	ammo.text = "AMMO: " + str($gun.bullets) + "/" + str($gun.reserve)
	healthLabel.text = "HEALTH: " + str(health)

func shop():
	shopui.show()
func shopexit():
	shopui.hide()

func _on_shop_ui_ammoup() -> void:
	$gun.reserve += 24


func _on_shop_ui_healthup() -> void:
	health += 25

func death() -> void:
	get_tree().change_scene_to_file("res://scenes/death.tscn")
