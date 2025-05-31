extends CanvasLayer

var player: Player

@onready var player_info: Label = $PlayerInfo
@onready var coin_info: Label = $CoinInfo

@export var debug: bool = false: set = _debug_setter

func _ready() -> void:
	player = GameManager.player

func _process(delta: float) -> void:
	var head = player.body[0]
	player_info.text = "头部位置:\t" + str(head)
	coin_info.text = "剩余金币:\t" + str(GameManager.grid_coins.count_valid()) + "\n当前位置:\t" + str(GameManager.grid_coins.get_value(head))

func _debug_setter(value: bool):
	debug = value
	set_process(debug)
