extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var enemy = $"."
var speed = 20
var Is_player = true
var Player = null

func  _physics_process(delta: float) -> void:
	if Player:
		var dir = (Player.position - position).normalized()
		velocity = dir * speed
		move_and_slide()

func _on_inaarea_body_entered(body: Node2D) -> void:
	Player = body
	if Player is CharacterBody2D and body.name == "Player":
		print('soso')
		Is_player = true
	
	
func _on_inaarea_body_exited(body: Node2D) -> void:
	Player = null
