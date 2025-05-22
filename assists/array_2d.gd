extends Object
class_name Array2D

var X: int
var Y: int
var values: Array

func _init(w: int, h: int, default_value: int = 0) -> void:
	X = w
	Y = h
	values = []
	for y in range(Y):
		var row = []
		for x in range(X):
			row.append(default_value)
		values.append(row)

func get_value(x: int, y: int):
	if y >= 0 and y < Y and x >= 0 and x < X:
		return values[y][x]
	return 0  # 或者抛出错误

func set_value(x: int, y: int, value: int):
	if y >= 0 and y < Y and x >= 0 and x < X:
		values[y][x] = value
