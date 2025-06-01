extends Node2D
class_name CoinManager

const COIN = preload("res://scenes/coin/coin.tscn")

@export var init_quantity: int = 60

func _ready() -> void:
	for i in range(init_quantity):
		var x = randi_range(1, GameManager.FIELD_SIZE.x - 2)
		var y = randi_range(-3, GameManager.FIELD_SIZE.y + 2)
		spawn(Vector2(x, y))
	GameManager.init_coins()
		
func spawn(g_pos: Vector2):
	var coin = COIN.instantiate()
	coin.grid_position = g_pos
	add_child(coin)
	
