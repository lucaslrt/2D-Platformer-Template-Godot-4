extends CharacterBody2D
class_name Player

@onready var player_sprite: Sprite2D = $Sprite
@export var speed: int = 75

func _physics_process(delta: float):
	horizontal_movement_env()
	move_and_slide()
	player_sprite.animate(velocity)

func horizontal_movement_env():
	var input_direction: float = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

	velocity.x = input_direction * speed
	print(velocity.x)
