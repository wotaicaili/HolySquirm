extends Node

func grid2real(grid_pos: Vector2):
	# 将grid中位置转化为真实的global_position
	# 例如grid(0,0)会转换成real(8,8)
	return grid_pos * GameManager.GRID_SIZE + Vector2.ONE * GameManager.GRID_SIZE/2.0
