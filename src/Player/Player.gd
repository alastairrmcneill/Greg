extends KinematicBody2D

export var gamePad = true

onready var tankTop = $TankTop
onready var tankBase = $TankBase

func _ready():
	tankTop.gamePad = gamePad
	tankBase.gamePad = gamePad
	
func _physics_process(delta):
	tankTop.position = tankBase.position

