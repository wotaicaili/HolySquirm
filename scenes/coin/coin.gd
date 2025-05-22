extends Node2D
class_name Coin

@export var grid_position: Vector2
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready():
	position = grid_position * GameManager.GRID_SIZE

func collect():
	remove_from_group("coin")
	animation_player.play("collect")
	await animation_player.animation_changed
	queue_free()
