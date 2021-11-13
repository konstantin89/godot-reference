extends KinematicBody2D

var linear_velocity = Vector2(0, 0)

const UP_DIRECTION = Vector2(0, -1)
const MOVING_SPEED = 600
const GRAVITY = 40
const DEATH_HIGHT = 2000
const JUMP_SPEED = 1000

onready var sprite = $Sprite

func _physics_process(delta):
		
	apply_gravity()
	
	if Input.is_action_pressed("left"):
		linear_velocity.x = -MOVING_SPEED
	elif Input.is_action_pressed("right"):
		linear_velocity.x = MOVING_SPEED
	else:
		linear_velocity.x = 0
		
	if  Input.is_action_pressed("up") and is_on_floor():
		$JumpSound.play()
		linear_velocity.y = -JUMP_SPEED
		
	elif Input.is_action_pressed("down"):
		pass
		
	move_and_slide(linear_velocity, UP_DIRECTION)
	
	animate()
		
		
func apply_gravity():
	
	if(position.y > DEATH_HIGHT):
		get_tree().call_group("GameRules", "end_game")
	
	if is_on_floor():
		linear_velocity.y = 0
	else:
		linear_velocity.y += Globals.GARVITY
		
	if is_on_ceiling():
		linear_velocity.y = 0
	
func animate():
	if(linear_velocity.x > 0):
		sprite.play("Walk")
		sprite.flip_h = false
	elif(linear_velocity.x < 0):
		sprite.play("Walk")
		sprite.flip_h = true
	else:
		sprite.play("Idle")
		
func take_damage():
		print("Player takes danage")
		$DamageSound.play()
		linear_velocity.y = -JUMP_SPEED*0.5
		

