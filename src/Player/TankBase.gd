extends KinematicBody2D

export var gamePad = true

var velocity = Vector2.ZERO
var speed = 10000

func _ready():
	pass
	
func _physics_process(delta):
	var direction = Vector2.ZERO
	if gamePad:
		
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
		

	else:
		var rotationDirection = Input.get_action_strength("RotateRight") - Input.get_action_strength("RotateLeft")
		rotation += rotationDirection * 0.1
		
		direction.x = Input.get_action_strength("Forwards") - Input.get_action_strength("Backwards")
		
		direction = direction.rotated(rotation)
		
	print(direction)
	velocity = direction * speed * delta
	move_and_slide(velocity)
