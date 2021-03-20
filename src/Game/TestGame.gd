extends Node2D

onready var player = $Player
onready var bulletManager = $BulletManager

func _ready():
	GlobalSignals.connect("bullet_fired", bulletManager, "handle_bullet_spawned")
