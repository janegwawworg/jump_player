extends KinematicBody2D

onready var _sprite = $Sprite
onready var _idle_img = preload("res://img/Player_Idle.png")
onready var _jump_img = preload("res://img/Player_Jump.png")

var time := 0.0
var speed := 600
var vel: Vector2
var walking := false
var gravity := 800
var jumpForce := 600
var jumping := false



func _physics_process(delta) -> void:
	time += delta
	if jumping and is_on_floor():
		jumping = false
	if time > 1:
		_sprite.texture = _idle_img
	print(time)
	vel.y += gravity * delta
	
	move_and_slide(vel, Vector2(0, -1))
	

func _input(event) -> void:
	if event.is_action_pressed("ui_accept") and is_on_floor():
		_jump()

func _walk(is_walk) -> void:
	if is_walk:
		walking = true
	else:
		walking = false

	
func _jump() -> void:
	jumping = true
	time = 0.0
	_sprite.texture = _jump_img
	vel.y = -jumpForce

func die() -> void:
	get_tree().reload_current_scene()
