extends Camera2D

# 相机跟随和缩放参数
var zoom_base = 5.0  # 基础缩放值
var zoom_factor = 0.05  # 缩放系数
var min_zoom = 0.25  # 最小缩放
var max_zoom = 4.0  # 最大缩放

func _process(_delta):
	if not GameManager.player:
		return
		
	# 获取玩家头部位置并跟随
	var head_grid_pos = GameManager.player.body[0]
	global_position = Util.grid2real(head_grid_pos)
	
	# 根据玩家长度动态调整缩放
	var player_length = GameManager.player.body.size()
	var target_zoom = zoom_base - (player_length * zoom_factor)
	
	# 限制缩放范围
	target_zoom = clamp(target_zoom, min_zoom, max_zoom)
	
	# 平滑过渡到目标缩放值
	zoom = zoom.lerp(Vector2(target_zoom, target_zoom), 0.1)
