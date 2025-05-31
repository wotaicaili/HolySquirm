extends Node

const GRID_SIZE = 16
const FIELD_SIZE = Vector2(48, -320)
const FIELD_X_RANGE = Vector2(1, GameManager.FIELD_SIZE.x)
const FIELD_Y_RANGE = Vector2(-1, GameManager.FIELD_SIZE.y)

var player: Player

var grid_values: Array2D = Array2D.new(FIELD_X_RANGE, FIELD_Y_RANGE)
var grid_coins: Array2D = Array2D.new(FIELD_X_RANGE, FIELD_Y_RANGE)

func _ready() -> void:
	pass

func _process(delta):
	for coin in get_tree().get_nodes_in_group("coin"):
		if coin is Coin:
			var grid_pos = coin.grid_position
			grid_coins.set_value(grid_pos, coin)
	for worm in get_tree().get_nodes_in_group("worm"):
		if worm is Worm:
			for grid_pos in worm.body:
				grid_values.set_value(grid_pos, 1)
