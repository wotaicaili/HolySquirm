extends Node

const GRID_SIZE = 16
const FIELD_SIZE = Vector2(48, -320)
const FIELD_X_RANGE = Vector2(1, GameManager.FIELD_SIZE.x)
const FIELD_Y_RANGE = Vector2(-1, GameManager.FIELD_SIZE.y)

var player: Player

var grid_entities: Array2D = Array2D.new(FIELD_X_RANGE, FIELD_Y_RANGE, null)
var grid_coins: Array2D = Array2D.new(FIELD_X_RANGE, FIELD_Y_RANGE, null)

func _ready() -> void:
	pass
	
func init_coins():
	grid_coins.clear()
	for coin in get_tree().get_nodes_in_group("coin"):
		if coin is Coin:
			var grid_pos = coin.grid_position
			grid_coins.set_value(grid_pos, coin)

func update_entity():
	grid_entities.clear()
	for entity in get_tree().get_nodes_in_group("entity"):
		if entity is Worm:
			for grid_pos in entity.body:
				grid_entities.set_value(grid_pos, entity)
		elif entity is Potato:
			for grid_pos in entity.body:
				grid_entities.set_value(grid_pos, entity)
