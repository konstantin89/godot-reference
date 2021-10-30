extends KinematicBody2D

var linear_velocity = Vector2(0, 0)

const UP_DIRECTION = Vector2(0, -1)
const MOVING_SPEED = 300
const GRAVITY = 10

onready var sprite = $Sprite


func _physics_process(delta):
		
	apply_gravity()
	
	if Input.is_action_pressed("left"):
		linear_velocity.x = -MOVING_SPEED
	elif Input.is_action_pressed("right"):
		linear_velocity.x = MOVING_SPEED
	else:
		linear_velocity.x = 0
		
	if  Input.is_action_pressed("up"):
		pass
	elif Input.is_action_pressed("down"):
		pass
		
	move_and_slide(linear_velocity, UP_DIRECTION)
	
	animate()
		
		
func apply_gravity():
	if is_on_floor():
		linear_velocity.y = 0
	else:
		linear_velocity.y += GRAVITY
	
func animate():
	if(linear_velocity.x > 0):
		sprite.play("Walk")
		sprite.flip_h = false
	elif(linear_velocity.x < 0):
		sprite.play("Walk")
		sprite.flip_h = true
	else:
		sprite.play("Idle")
		
		
		
		
		
		
		
