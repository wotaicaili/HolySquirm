extends Object
class_name Array2D

var X_range: Vector2
var Y_range: Vector2
var values: Dictionary  # 嵌套 Dictionary 支持负索引

func _init(x_range: Vector2, y_range: Vector2, default_value: Variant = 0) -> void:
	X_range = x_range
	Y_range = y_range
	values = {}

	for y in range(int(Y_range.x), int(Y_range.y)):
		values[y] = {}
		for x in range(int(X_range.x), int(X_range.y)):
			values[y][x] = default_value

func get_value(grid_pos: Vector2i) -> Variant:
	var y = grid_pos.y
	var x = grid_pos.x
	if values.has(y) and values[y].has(x):
		return values[y][x]
	return null  # 或者设为默认值

func set_value(grid_pos: Vector2i, value: Variant) -> void:
	var y = grid_pos.y
	var x = grid_pos.x
	if not values.has(y):
		values[y] = {}
	values[y][x] = value
	
func count_valid() -> int:
	var count := 0
	for y in values:
		for x in values[y]:
			var v = values[y][x]
			if v:
				count += 1
	return count
