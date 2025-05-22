extends Worm
class_name Player

func _ready():
	super._ready()
	GameManager.player = self

func _unhandled_input(event: InputEvent):
	if event is InputEventKey and event.pressed and not event.echo:
		var new_dir = Vector2(0, 0)
		match event.keycode:
			KEY_UP:
				new_dir = Vector2(0, -1)
			KEY_DOWN:
				new_dir = Vector2(0, 1)
			KEY_LEFT:
				new_dir = Vector2(-1, 0)
			KEY_RIGHT:
				new_dir = Vector2(1, 0)
		# 防止反向自杀
		if new_dir == -direction:
			return
		if new_dir.length() > 0:
			# 立即移动
			direction = new_dir
			next_direction = new_dir
			move(new_dir)
