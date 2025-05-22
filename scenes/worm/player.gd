extends Worm
class_name Player

func _ready():
	set_process(true)

func _unhandled_input(event):
	if event is InputEventKey and event.pressed and not event.echo:
		var new_dir = direction
		if event.keycode == KEY_UP:
			new_dir = Vector2(0, -1)
		elif event.keycode == KEY_DOWN:
			new_dir = Vector2(0, 1)
		elif event.keycode == KEY_LEFT:
			new_dir = Vector2(-1, 0)
		elif event.keycode == KEY_RIGHT:
			new_dir = Vector2(1, 0)
		# 防止反向自杀
		if body.size() > 1 and new_dir == -direction:
			return
		# 立即移动
		direction = new_dir
		next_direction = new_dir
		move(new_dir)
