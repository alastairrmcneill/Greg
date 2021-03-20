extends Node2D
class_name Gun
signal weapon_fired(bullet, location, direction)

export (PackedScene) var Bullet
export var Fire_Rate: float = 1.0

onready var endOfGun = $EndOfGun
onready var shootCooldown = $ShootCooldownTimer
onready var animationPlayer = $AnimationPlayer

func _ready():
	set_cooldown_timer(Fire_Rate)
	
func shoot():
	print(shootCooldown.wait_time)
	print(shootCooldown.is_stopped())
	if shootCooldown.is_stopped():
		var bullet_instance = Bullet.instance()
		var target = endOfGun.global_position
		var direction = global_position.direction_to(target).normalized()
		GlobalSignals.emit_signal("bullet_fired", bullet_instance, endOfGun.global_position, direction)
		shootCooldown.start()
		animationPlayer.play("MuzzleFlash")
		
func set_cooldown_timer(rate):
	var delay = 1/Fire_Rate
	shootCooldown.wait_time = delay
