extends Node2D

var currentWeaponIndex: int = 1
var currentWeapon: Weapon = null
var weapons: Array = []


func _ready():
	GlobalSignals.connect("weapon_out_of_ammo", self, "remove_weapon")
	
	set_weapon(currentWeaponIndex)
	
func _process(delta):
	if Input.is_action_pressed("shoot"):
		currentWeapon.shoot()
	
func _unhandled_input(event):
	pass
		
func set_weapon(index: int):
	weapons = get_children()
	
	for weapon in weapons:
		weapon.hide()
		
	currentWeaponIndex = index 
	currentWeapon = weapons[currentWeaponIndex]
	
	currentWeapon.show()
	

func add_weapon(weapon: Weapon):
	weapons = get_children()
	
	if weapons.size() == 1:
		add_child(weapon)
	else:
		remove_child(weapons[1])
		add_child(weapon)
	
	set_weapon(1)
	
func remove_weapon(weapon: Weapon):
	weapons = get_children()
	if weapon in weapons:
		remove_child(weapon)
	
	set_weapon(0)
	
