extends HBoxContainer

export (int, 99999) var score


func _ready():
	set_score(0)


func set_score(value: int) -> void:
	var score = int(value)
	if score >= 0:
		get_node("Number").text = String(score)
