extends Node2D

onready var _player := $Player
onready var _score := $Score
onready var _enermy := $Enermy

var score := 0


func _ready() -> void:
	_player.connect("jump", self, "_on_player_jump")
	
	
func _on_player_jump() -> void:
	print(_player.position.x, "e:",_enermy.position.x)
	if  _player.position.x >= _enermy.position.x - 76 && _player.position.x <= _enermy.position.x + 76:
		score += 1
		_score.set_score(score)
