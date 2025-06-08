extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var animated_spriter: AnimatedSprite2D = $AnimatedSprite2Dplayer


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY / 1.2

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flip the sprite
	if direction > 0:
		animated_spriter.flip_h = false
	elif direction < 0:
		animated_spriter.flip_h = true
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_spriter.play("idle")
		elif direction != 0:
			animated_spriter.play("run")
	else:
		animated_spriter.play("jump")
	
	if direction:
		velocity.x = direction * SPEED / 1.5
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
