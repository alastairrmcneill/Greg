extends Area2D
class_name Bullet


var speed = 400
var direction = Vector2.ZERO

func _ready():
	pass

func _physics_process(delta):
	if direction != Vector2.ZERO:
		var velocity = speed * direction * delta
		
		global_position += velocity
	
func set_direction(direction):
	self.direction = direction
	rotation = direction.angle()
	
