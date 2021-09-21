extends Area2D


# Declare member variables here. Examples:
onready var _animate_sprite = $AnimationPlayer

var speed := 100.0


# Called when the node enters the scene tree for the first time.
func _ready():
	_animate_sprite.play("rotate")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta) -> void:
	_move(delta)

func _move(delta) -> void:
	position.x -= delta * speed
	if position.x < -15:
		position.x = 1100


func _on_Enermy_body_entered(body):
	if body.name == "Player":
		body.die()
