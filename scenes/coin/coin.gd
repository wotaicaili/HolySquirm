extends Node2D
class_name Coin

@export var grid_position: Vector2
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var area_2d: Area2D = $Area2D

func _ready():
	position = Util.grid2real(grid_position)
	area_2d.area_entered.connect(_on_area_entered)

func collect():
	GameManager.grid_coins.set_value(grid_position, null)
	animation_player.play("collect")
	await animation_player.animation_changed
	queue_free()

func _on_area_entered(area: Area2D):
	collect()
