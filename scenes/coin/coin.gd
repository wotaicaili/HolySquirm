extends Node2D
class_name Coin

@export var grid_position: Vector2
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready():
	global_position = Util.grid2real(grid_position)

func collect():
	GameManager.grid_coins.set_value(grid_position, null)
	animation_player.play("collect")
	await animation_player.animation_changed
	queue_free()
