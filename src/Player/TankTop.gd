extends KinematicBody2D

export var gamePad = true

func _ready():
	pass
	
func _physics_process(delta):
	if gamePad:
		var direction = Vector2.ZERO
		var desiredRotation = 0
		var currentRotation = rotation
		
		direction.x = Input.get_joy_axis(0, JOY_AXIS_2)
		direction.y = Input.get_joy_axis(0, JOY_AXIS_3)
		
		if direction.length() > 0.5:
			desiredRotation = direction.angle()
		else:
			desiredRotation = currentRotation
		
		
		rotation = desiredRotation
		
	else: 
		look_at(get_global_mouse_position())

