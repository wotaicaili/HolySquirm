extends Node2D
class_name Potato

@export var body: Array = [Vector2(0,0),Vector2(1,0),Vector2(0,1),Vector2(1,1)]: # 占四个格子，第一个为左上角
	set(value):
		body = value
		center = (body[0] + body[3]) / 2.0
@onready var potato_anim: AnimatedSprite2D = $PotatoAnim
@onready var explosion_sprite: Sprite2D = $ExplosionSprite

var center: Vector2

func _ready():
	potato_anim.show()
	explosion_sprite.hide()

func place():
	global_position = Util.grid2real(center)

func explode():
	potato_anim.hide()
	explosion_sprite.show()
	await get_tree().create_timer(1.0).timeout
	queue_free()
	
