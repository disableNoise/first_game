extends Node2D

const SPEED = 60
var direction = 1

@onready var ray_cast_2d_right: RayCast2D = $RayCast2D_Right
@onready var ray_cast_2d_left: RayCast2D = $RayCast2D_Left
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _process(delta: float) -> void:
	if ray_cast_2d_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
		
	if ray_cast_2d_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
		
	position.x += direction * SPEED * delta
