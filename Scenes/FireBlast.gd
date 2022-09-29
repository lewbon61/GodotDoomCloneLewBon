extends Spatial

var can_shoot = true
onready var gunsprite = $CanvasLayer/Control/GunSprite
onready var spawn_location = $Position3D
onready var fireball = preload("res://Scenes/Fireball.tscn")

func launch_projectile():
	var new_fireball = fireball.instance()
	get_node("/root/World").add_child(new_fireball)
	new_fireball.global_transform = spawn_location.global_transform

func _process(delta):
	if Input.is_action_pressed("shoot") and can_shoot and PlayerStats.ammo_fireblast > 0:
		gunsprite.play("shoot")
		launch_projectile()
		PlayerStats.change_fireblast_ammo(-1)
		can_shoot = false
		yield(gunsprite,"animation_finished")
		can_shoot = true
		gunsprite.play("idle")
		
