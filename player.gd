extends CharacterBody2D
var dmg = 1
@onready var gun = $gun
@onready var ammo = $CanvasLayer/Control/ammo
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
	
	move_and_slide()
	
	ammo.text = "AMMO: " + str($gun.bullets) + "/" + str($gun.reserve)

func shop():
	shopui.show()
func shopexit():
	shopui.hide()

func _on_shop_ui_ammoup() -> void:
	$gun.reserve += 24


func _on_shop_ui_healthup() -> void:
	health += 25
