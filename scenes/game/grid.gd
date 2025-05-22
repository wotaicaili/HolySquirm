extends Node2D

# 网格大小常量
const GRID_COLOR = Color(0.2, 0.2, 0.2, 1.0)  # 不透明深灰色，确保可见性

# 网格范围
var grid_width: int = 40  # 设置一个默认值
var grid_height: int = 40  # 设置一个默认值

func _ready():
	# 获取TileMapLayerGround的尺寸
	var ground_layer = $TileMapLayerGround
	if ground_layer:
		var used_rect = ground_layer.get_used_rect()
		grid_width = used_rect.size.x
		grid_height = used_rect.size.y
		
		# 强制重绘
		queue_redraw()

func _draw():
	# 绘制垂直线
	for x in range(grid_width + 1):
		var start_pos = Vector2(x * GameManager.GRID_SIZE, 0)
		var end_pos = Vector2(x * GameManager.GRID_SIZE, grid_height * GameManager.GRID_SIZE)
		draw_line(start_pos, end_pos, GRID_COLOR, 1.0)  # 添加线宽参数
	
	# 绘制水平线
	for y in range(grid_height + 1):
		var start_pos = Vector2(0, y * GameManager.GRID_SIZE)
		var end_pos = Vector2(grid_width * GameManager.GRID_SIZE, y * GameManager.GRID_SIZE)
		draw_line(start_pos, end_pos, GRID_COLOR, 1.0)  # 添加线宽参数
