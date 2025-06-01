extends CanvasLayer

var player: Player

@onready var player_info: Label = $PlayerInfo
@onready var coin_info: Label = $CoinInfo
@onready var current_grid_info: Label = $CurrentGridInfo
@onready var body_info: Label = $BodyInfo

@export var debug: bool = false: set = _debug_setter

func _ready() -> void:
	player = GameManager.player
	if debug:
		player.to_grow = 30

func _process(delta: float) -> void:
	var head = player.body[0]
	player_info.text = "头部位置:\t" + str(head)
	coin_info.text = "剩余金币:\t" + str(GameManager.grid_coins.count_valid())
	
	var current_grid_value
	var current_grid_coin = GameManager.grid_coins.get_value(head)
	var current_grid_entity = GameManager.grid_entities.get_value(head)
	if current_grid_coin and current_grid_value:
		push_error("coin and 1")
	elif current_grid_coin:
		current_grid_value = current_grid_coin
	elif current_grid_entity:
		current_grid_value = current_grid_entity
	else:
		current_grid_value = null
	current_grid_info.text = "\n当前位置:\t" + str(current_grid_value)
	
	body_info.text = "蛆体总数:\t" + str(GameManager.grid_entities.count_valid() - $"../PotatoManager".get_child_count() * 4)
	
func _debug_setter(value: bool):
	debug = value
	set_process(debug)
