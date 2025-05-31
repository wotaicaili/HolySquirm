extends Node2D


func _ready() -> void:
	init_player()

func init_player(len: int = 3, speed: float = 0.2):
	var player = GameManager.player
	# 初始化player属性
