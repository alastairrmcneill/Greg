extends Node2D

var currentWeaponIndex = 0
var currentWeapon = null
var weapons: Array = []

func _ready():
	weapons = get_children()
	for weapon in weapons: 
		weapon.hide()
	
	currentWeapon = weapons[currentWeaponIndex]
	currentWeapon.show()
	
func _process(delta):
	if Input.is_action_pressed("shoot"):
		currentWeapon.shoot()
	
func _unhandled_input(event):
	if event.is_action_released("Swap Weapon"):
		swap_weapon()
		
func swap_weapon():
	if currentWeaponIndex == 0:
		currentWeaponIndex = 1
	else: 
		currentWeaponIndex = 0
		
	currentWeapon.hide()
	currentWeapon = weapons[currentWeaponIndex]
	
	currentWeapon.show()
		
