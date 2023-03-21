extends Sprite2D
class_name PlayerSprite

@export var animation_path: NodePath
@onready var animation: AnimationPlayer = get_node(animation_path)

@export var player_path: NodePath
@onready var player: Player = get_node(player_path)

func animate(direction: Vector2) -> void:
	verify_position(direction)

	if direction.y != 0:
		vertical_behavior(direction)
	elif player.landing:
		animation.play("landing")
		player.set_physics_process(false)
	else:
		horizontal_behavior(direction)

func verify_position(direction: Vector2) -> void:
	if direction.x > 0:
		flip_h = false
	elif direction.x < 0:
		flip_h = true

func horizontal_behavior(direction: Vector2) -> void:
	if direction.x != 0:
		animation.play("run")
	else:
		animation.play("idle")

func vertical_behavior(direction: Vector2) -> void:
	if direction.y > 0:
		player.landing = true
		animation.play("fall")
	elif direction.y < 0:
		animation.play("jump")


func _on_animation_finished(anim_name):
	match anim_name:
		"landing":
			player.landing = false
			player.set_physics_process(true)
	pass # Replace with function body.
