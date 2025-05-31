extends Node2D
class_name Worm

# 贴图资源
@export var head_texture: Texture2D
@export var body_texture: Texture2D
@export var tail_texture: Texture2D

# 身体坐标（Vector2数组，头在前）
var body: Array = [Vector2(10, -10)] # 初始只需要头坐标
var to_grow: int = 2 # 还没长出来的体节

# 用于显示的Sprite2D节点
var sprite_nodes: Array = []

# 当前移动方向，初始向上
var direction := Vector2(0, -1)
var next_direction := Vector2(0, -1)

# 移动间隔（秒）
@export var auto_move_interval := 0.8
var move_timer := 99.0

func _ready():
	set_process(true)
	update_worm_visual()

func _process(delta):
	move_timer += delta
	if move_timer >= auto_move_interval:
		direction = next_direction
		move(direction)

func move(direction: Vector2):
	var new_head = body[0] + direction
	body.insert(0, new_head)
	
	# 检查头部是否碰到 coin
	var head_pos = body[0]
	var coin = GameManager.grid_coins.get_value(head_pos)
	if coin:
		coin.collect()
			
	if not to_grow:
		body.pop_back()
	else:
		to_grow -= 1
	update_worm_visual()
	
	move_timer = 0.0

func grow():
	to_grow += 1

# 断尾：从断点index开始（含index）全部断掉
func cut_tail(index: int):
	if index > 0 and index < body.size():
		body = body.slice(0, index)
		update_worm_visual()

func update_worm_visual():
	# 先清理旧的sprite
	for s in sprite_nodes:
		s.queue_free()
	sprite_nodes.clear()

	for i in body.size():
		var sprite = Sprite2D.new()
		if i == 0:
			sprite.texture = head_texture
		elif i == body.size() - 1:
			sprite.texture = tail_texture
		else:
			sprite.texture = body_texture
		sprite.position = body[i] * GameManager.GRID_SIZE + Vector2(GameManager.GRID_SIZE/2, GameManager.GRID_SIZE/2)
		sprite.scale = Vector2(0.5, 0.5)  # 32x32缩放到16x16
		sprite.centered = true  # 居中

		# 设置rotation
		if i == 0 and body.size() > 1:
			# 头部朝向下一个身体段
			var dir = body[0] - body[1]
			sprite.rotation = atan2(dir.y, dir.x) + PI / 2 
		elif i > 0 and i < body.size() - 1:
			# 身体朝向前后两节的夹角
			var dir_prev = body[i] - body[i-1]
			var dir_next = body[i+1] - body[i]
			# 取前一节方向
			sprite.rotation = atan2(dir_prev.y, dir_prev.x) + PI / 2 
		elif i == body.size() - 1 and body.size() > 1:
			# 尾部朝向前一节
			var dir = body[i] - body[i-1]
			sprite.rotation = atan2(dir.y, dir.x) - PI / 2 

		add_child(sprite)
		sprite_nodes.append(sprite) 
