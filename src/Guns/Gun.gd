extends Node2D

signal gun_fired_bullet(bullet, position, direction)

export (PackedScene) var Bullet

onready var endOfGun = $EndOfGun

func _ready():
	pass
	
func shoot():
	var bullet_instance = Bullet.instance()
	var target = endOfGun.global_position
	var direction = global_position.direction_to(target).normalized()
	emit_signal("gun_fired_bullet", bullet_instance, endOfGun.global_position, direction)

	
