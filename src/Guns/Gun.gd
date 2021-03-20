extends Node2D
class_name Gun
signal gun_fired_bullet(bullet, position, direction)

export (PackedScene) var Bullet
export var Fire_Rate: float = 1.0

onready var endOfGun = $EndOfGun
onready var shootCooldown = $ShootCooldownTimer
onready var animationPlayer = $AnimationPlayer

func _ready():
	set_cooldown_timer(Fire_Rate)
	
func shoot():
	if shootCooldown.is_stopped():
		var bullet_instance = Bullet.instance()
		var target = endOfGun.global_position
		var direction = global_position.direction_to(target).normalized()
		emit_signal("gun_fired_bullet", bullet_instance, endOfGun.global_position, direction)
		shootCooldown.start()
		animationPlayer.play("MuzzleFlash")
		
func set_cooldown_timer(rate):
	var delay = 1/Fire_Rate
	shootCooldown.wait_time = delay
