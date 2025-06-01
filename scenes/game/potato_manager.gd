extends Node2D
class_name PotatoManager

const POTATO = preload("res://scenes/potato/potato.tscn")

@export var init_quantity: int = 30

func _ready() -> void:
	for i in range(init_quantity):
		var x = randi_range(1, GameManager.FIELD_SIZE.x - 3)
		var y = randi_range(-21, GameManager.FIELD_SIZE.y + 2)
		spawn(Vector2(x, y))

func spawn(g_pos: Vector2):
	var potato = POTATO.instantiate()
	potato.body = [g_pos,g_pos+Vector2(1,0),g_pos+Vector2(0,1),g_pos+Vector2(1,1)]
	add_child(potato)
	potato.place()
	
