extends Node2D

const GRID_SIZE = 16  # tilemap的实际大小
const GRID_WIDTH = 40  # 场地宽度
const GRID_HEIGHT = 60  # 场地高度

# 瓦片索引
const TILE_GROUND = Vector2i(0, 0)  # 地面瓦片
const TILE_GRASS = Vector2i(1, 0)   # 草地瓦片
const TILE_FLOWER = Vector2i(2, 0)  # 花朵瓦片
const TILE_ROCK = Vector2i(3, 0)    # 石头瓦片

@onready var tilemap = $TileMap

func _ready():
	create_ground()

func create_ground():
	# 创建基础地面
	for x in range(GRID_WIDTH):
		for y in range(GRID_HEIGHT):
			# 使用地面瓦片作为基础
			tilemap.set_cell(0, Vector2i(x, y), 0, TILE_GROUND)
	
	# 添加随机装饰物
	for x in range(GRID_WIDTH):
		for y in range(GRID_HEIGHT):
			var rand = randf()
			if rand < 0.05:  # 5%的概率放置草地
				tilemap.set_cell(0, Vector2i(x, y), 0, TILE_GRASS)
			elif rand < 0.07:  # 2%的概率放置花朵
				tilemap.set_cell(0, Vector2i(x, y), 0, TILE_FLOWER)
			elif rand < 0.09:  # 2%的概率放置石头
				tilemap.set_cell(0, Vector2i(x, y), 0, TILE_ROCK) 
