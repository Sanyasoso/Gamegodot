extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var enemy = $"."
@export var speed = 20
var Is_player = true
var Player = null

func  _physics_process(delta: float) -> void:
	if Player:
		var dir = (Player.position - position).normalized()
		velocity = dir * speed
		move_and_slide()
	
	if enemy.velocity.x == 1:
		anim.flip_h = false
		anim.play("walk_right")
	elif enemy.velocity.x < 0:
		anim.flip_h = true
		anim.play("walk_right")
	if enemy.velocity.y < 0:
		anim.play("walk_up")
	elif enemy.velocity.y > 0:
		anim.play("walk_down")
	else:
		anim.play("walk_down")
		velocity = Vector2.ZERO
	
		
func _on_inaarea_body_entered(body: Node2D) -> void:
	Player = body
	if Player is CharacterBody2D and body.name == "Player":
		Is_player = true
	
	
func _on_inaarea_body_exited(body: Node2D) -> void:
	Player = null
