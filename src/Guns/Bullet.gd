extends Area2D
class_name Bullet

export var Bullet_Life_Time: float = 1

onready var killTimer = $KillTimer

var speed = 400
var direction = Vector2.ZERO

func _ready():
	killTimer.wait_time = Bullet_Life_Time
	killTimer.start()

func _physics_process(delta):
	if direction != Vector2.ZERO:
		var velocity = speed * direction * delta
		
		global_position += velocity
	
func set_direction(direction):
	self.direction = direction
	rotation = direction.angle()
	


func _on_KillTimer_timeout():
	queue_free()
