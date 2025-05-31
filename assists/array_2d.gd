extends Object
class_name Array2D

var X_range: Vector2
var Y_range: Vector2
var values: Dictionary  # 嵌套 Dictionary 支持负索引
var default_value

func _init(x_range: Vector2, y_range: Vector2, default_value: Variant = 0) -> void:
	X_range = x_range
	Y_range = y_range
	values = {}
	default_value = default_value
			
func clear(_default_value: Variant = default_value):
	values = {}

func get_value(grid_pos: Vector2i) -> Variant:
	var y = grid_pos.y
	var x = grid_pos.x
	if values.has(y) and values[y].has(x):
		return values[y][x]
	return default_value  # 或者设为默认值

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
