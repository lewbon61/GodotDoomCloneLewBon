extends Node
#Player variables
 
 
var health = 100
var max_health = 100
var armor = 0
var max_armor = 100
var guns_carried = []
var ammo_pistol = 50
var ammo_rocket = 0
var ammo_shells = 15
var ammo_plasma = 50
var ammo_fireblast = 20
var ammo_bow = 50
var ammo_max_pistol = 200
var ammo_max_rocket = 50
var ammo_max_shells = 100
var ammo_max_plasma = 200
var ammo_max_fireblast = 200
var ammo_max_bow = 360
 
var red_key = false
var blue_key = false
var yellow_key = false
var current_gun = "Pistol"
 
func reset():
	var health = 100
	var max_health = 100
	var armor = 0
	var max_armor = 100
	var guns_carried = []
	var ammo_pistol = 50
	var ammo_rocket = 0
	var ammo_shells = 15
	var ammo_plasma = 50
	var ammo_fireblast = 20
	var ammo_bow = 50
	var ammo_max_pistol = 200
	var ammo_max_rocket = 50
	var ammo_max_shells = 100
	var ammo_max_plasma = 200
	var ammo_max_fireblast = 200
	var ammo_max_bow = 360
	var red_key = false
	var blue_key = false
	var yellow_key = false
	var current_gun = "Pistol"
 
func _ready():
	pass
	
func take_damage(amount):
	
	if amount > armor:
		amount = amount - armor
		armor = 0
	else:
		change_armor(-amount)
		return
	###apply remaining damage to health
	change_health(-amount)
		
	
func change_health(amount):
	health += amount
	health = clamp(health, 0, max_health)
	
func change_armor(amount):
	armor += amount
	armor = clamp(armor,0,max_armor)
	
func change_pistol_ammo(amount):
	ammo_pistol+=amount
	ammo_pistol = clamp(ammo_pistol,0,ammo_max_pistol)
	
func change_shotgun_ammo(amount):
	ammo_shells+=amount
	ammo_shells = clamp(ammo_shells,0,ammo_max_shells)
	
func change_rocket_ammo(amount):
	ammo_rocket+=amount
	ammo_rocket = clamp(ammo_rocket,0,ammo_max_rocket)
	
func change_plasma_ammo(amount):
	ammo_plasma+=amount
	ammo_plasma = clamp(ammo_plasma,0,ammo_max_plasma)
	
func change_fireblast_ammo(amount):
	ammo_fireblast+=amount
	ammo_fireblast = clamp(ammo_fireblast,0,ammo_max_fireblast)

func change_bow_ammo(amount):
	ammo_bow+=amount
	ammo_bow = clamp(ammo_bow,0,ammo_max_bow)



	
func get_pistol_ammo():
	return str(ammo_pistol)
 
func get_shotgun_ammo():
	return str(ammo_shells)
 
func get_rocket_ammo():
	return str(ammo_rocket)
	
func get_plasma_ammo():
	return str(ammo_plasma)
	
func get_fireblast_ammo():
	return str(ammo_fireblast)

func get_bow_ammo():
	return str(ammo_bow)

	
func get_health():
	return str(health)
 
func get_armor():
	return str(armor)
	
 
 
	
 
