extends CharacterBody2D

@export var speed = 0.5

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Walk_up"):
		velocity.y = -1
	elif Input.is_action_pressed("Walk_down"):
		velocity.y = 1
	else:
		velocity.y = 0
	if Input.is_action_pressed("Walk_right"):
		velocity.x = 1
	elif Input.is_action_pressed("Walk_left"):
		velocity.x = -1
	else:
		velocity.x = 0
		
		
	velocity = velocity.normalized() * speed
	move_and_collide(velocity)

	if velocity.x == 0 and velocity.y == 0:
		$playeranim.play("idle")
		
	if Input.is_action_pressed("Walk_up"):
		$playeranim.play("Walk_up")
	elif Input.is_action_pressed("Walk_down"):
		$playeranim.play("Walk_down")
	if Input.is_action_pressed("Walk_right"):
		$playeranim.play("Walk_right")
		$playeranim.flip_h = false
	elif Input.is_action_pressed("Walk_left"):
		$playeranim.flip_h = true
		$playeranim.play("Walk_right")
