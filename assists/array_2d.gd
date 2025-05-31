extends Object
class_name Array2D

var X: int
var Y: int
var values: Array

func _init(size: Vector2, default_value: int = 0) -> void:
	X = size.x
	Y = size.y
	values = []
	for y in range(Y):
		var row = []
		for x in range(X):
			row.append(default_value)
		values.append(row)

func get_value(grid_pos: Vector2):
	var x = grid_pos.x
	var y = grid_pos.y
	if y >= 0 and y < Y and x >= 0 and x < X:
		return values[y][x]
	return 0 

func set_value(grid_pos: Vector2, value: Variant):
	var x = grid_pos.x
	var y = grid_pos.y
	if y >= 0 and y < Y and x >= 0 and x < X:
		values[y][x] = value
