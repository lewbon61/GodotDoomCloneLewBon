extends Area
export (int) var ammo_var = 5

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AmmoKit_body_entered(body):
	if body.is_in_group("Player"):
		PlayerStats.change_bow_ammo(ammo_var)
		PlayerStats.change_fireblast_ammo(ammo_var)
		PlayerStats.change_pistol_ammo(ammo_var)
		PlayerStats.change_plasma_ammo(ammo_var)
		PlayerStats.change_rocket_ammo(ammo_var)
		PlayerStats.change_shotgun_ammo(ammo_var)
		queue_free()
