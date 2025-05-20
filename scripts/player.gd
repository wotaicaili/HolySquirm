extends Node2D

const GRID_SIZE = 16  # 更新为tilemap的实际大小
const MOVE_SPEED = 0.1  # 移动速度（秒）

var segments = []  # 存储蛆的身体段
var direction = Vector2.ZERO  # 当前移动方向
var can_move = true  # 是否可以移动
var target_position = Vector2.ZERO  # 目标位置

func _ready():
	# 初始化蛆的身体
	segments.append(self)
	target_position = position

func _process(delta):
	if can_move:
		handle_input()
	
	# 平滑移动到目标位置
	position = position.lerp(target_position, 1.0 - pow(0.1, delta))

func handle_input():
	if Input.is_action_just_pressed("ui_up"):
		move(Vector2.UP)
	elif Input.is_action_just_pressed("ui_down"):
		move(Vector2.DOWN)
	elif Input.is_action_just_pressed("ui_left"):
		move(Vector2.LEFT)
	elif Input.is_action_just_pressed("ui_right"):
		move(Vector2.RIGHT)

func move(new_direction):
	if new_direction == -direction:  # 防止反向移动
		return
	
	direction = new_direction
	target_position += direction * GRID_SIZE
	
	# 移动身体段
	for i in range(segments.size() - 1, 0, -1):
		segments[i].target_position = segments[i-1].position
	
	can_move = false
	await get_tree().create_timer(MOVE_SPEED).timeout
	can_move = true 
