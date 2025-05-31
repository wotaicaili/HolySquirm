extends Node

const GRID_SIZE = 16
const FIELD_SIZE = Vector2(48, -320)
#var field_border_x = Vector2(1, GameManager.FIELD_SIZE.x - 2)
#var field_border_y = Vector2(-1, GameManager.FIELD_SIZE.y + 2)

var player: Player

var grid_values: Array2D = Array2D.new(FIELD_SIZE)
var grid_coins: Array2D = Array2D.new(FIELD_SIZE)

func _ready() -> void:
	for coin in get_tree().get_nodes_in_group("coin"):
		if coin is Coin:
			var grid_pos = coin.grid_position
			grid_coins.set_value(grid_pos, coin)

func _physic_process(delta):
	for worm in get_tree().get_nodes_in_group("worm"):
		if worm is Worm:
			for grid_pos in worm.body:
				grid_values.set_value(grid_pos, 1)
