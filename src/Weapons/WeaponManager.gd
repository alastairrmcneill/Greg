extends Node2D

onready var current_weapon = $Pistol

var weapons: Array = []

func _ready():
	weapons = get_children()
	
	

