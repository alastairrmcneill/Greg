extends Node2D

onready var gun:Gun = $Player/TurretSprite/Gun
onready var bulletManager = $BulletManager

func _ready():
	gun.connect("gun_fired_bullet", bulletManager, "handle_bullet_spawned")
