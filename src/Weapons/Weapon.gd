extends Node2D
class_name Weapon


export (PackedScene) var Bullet
export var ammo: int = 1
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
		GlobalSignals.emit_signal("bullet_fired", bullet_instance, endOfGun.global_position, direction)
		shootCooldown.start()
		animationPlayer.play("MuzzleFlash")
		check_ammo()
		
		
		
func set_cooldown_timer(rate):
	var delay = 1/Fire_Rate
	shootCooldown.wait_time = delay

func check_ammo():
	ammo -= 1
	print(ammo)
	if ammo == 0:
		GlobalSignals.emit_signal("weapon_out_of_ammo", self)
