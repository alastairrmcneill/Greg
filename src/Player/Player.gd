extends KinematicBody2D

export var gamePad = true

onready var turretSprite = $TurretSprite

var velocity = Vector2.ZERO
var speed = 10000
var turretRotation = 0


func _ready():
	pass
	
func _physics_process(delta):
	var direction = Vector2.ZERO
	if gamePad:
		var currentTurretRotation = turretSprite.global_rotation
		direction = move_tank_gamepad(direction)
		turretRotation = rotate_turret_gamepad(currentTurretRotation)

	else:
		direction = move_tank_keyboard(direction)
		turretRotation = rotate_turret_mouse()
		
	velocity = direction * speed * delta
	move_and_slide(velocity)



func move_tank_gamepad(direction):
	var currentRotation = rotation
	var desiredRotation = 0
	
	
	direction.x = Input.get_joy_axis(0, JOY_AXIS_0)
	direction.y = Input.get_joy_axis(0, JOY_AXIS_1)
	
	if direction.length() > 0.5:
		desiredRotation = direction.angle()
		direction = direction.normalized()
	else: 
		direction = Vector2.ZERO
		desiredRotation = currentRotation

	rotation = desiredRotation
	
	return direction

func rotate_turret_gamepad(currentTurretRotation):
	var stickDirection = Vector2.ZERO
	var desiredRotation = 0
	

	stickDirection.x = Input.get_joy_axis(0, JOY_AXIS_2)
	stickDirection.y = Input.get_joy_axis(0, JOY_AXIS_3)

	if stickDirection.length() > 0.5:
		desiredRotation = stickDirection.angle()
	else:
		desiredRotation = currentTurretRotation


	turretSprite.global_rotation = desiredRotation
	
	return turretSprite.global_rotation


func move_tank_keyboard(direction):
	var rotationDirection = Input.get_action_strength("RotateRight") - Input.get_action_strength("RotateLeft")
	rotation += rotationDirection * 0.1
	
	direction.x = Input.get_action_strength("Forwards") - Input.get_action_strength("Backwards")
	
	direction = direction.rotated(rotation)
	
	return direction

func rotate_turret_mouse():
	turretSprite.look_at(get_global_mouse_position())
	
	if turretSprite.rotation > PI:
		turretSprite.rotation -= 2*PI
	elif turretSprite.rotation < -PI:
		turretSprite.rotation += 2*PI
		
	return turretSprite.global_rotation


