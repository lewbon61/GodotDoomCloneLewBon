extends KinematicBody

onready var nav = get_tree().get_nodes_in_group("NavMesh")[0]
onready var player = get_tree().get_nodes_in_group("Player")[0]


var path = [] #hold the path coordinates from the enemy to the player
var path_index = 0
var speed = 10
var health = 700.42069
var move = true

var searching = false
var hitting = false
var dead = false
var can_hit = false

var damage = 20

onready var ray = $Visual

func _ready():
	pass
	
func take_damage(dmg_amount):
	health -= dmg_amount
	if health <= 0:
		death()
		return
	#else:
	#	move = false
	#	$AnimatedSprite3D.play("hit")
	#	yield($AnimatedSprite3D, "animation_finished")
	#	#$AnimatedSprite3D.play("walk")
	#	move = true
	


func _physics_process(delta):
	if dead:
		return
	look_at_player()
	if searching and not hitting:
		if path_index < path.size():
			var direction = (path[path_index] - global_transform.origin)
			#print(direction.length())
			if direction.length() < 1:
				
				path_index += 1
			else:
				if move:
					$AnimatedSprite3D.play("walk")
					move_and_slide(direction.normalized() * speed, Vector3.UP)
	else:
		if not hitting:
			$AnimatedSprite3D.play("idle")
	

func look_at_player():
	ray.look_at(player.global_transform.origin, Vector3.UP)
	if ray.is_colliding():
		if ray.get_collider().is_in_group("Player"):
			searching = true
			
		else:
			searching = false
			var check_near = $Aural.get_overlapping_bodies()
			for body in check_near:
				if body.is_in_group("Player"):
					searching = true


	
func find_path(target):
	path = nav.get_simple_path(global_transform.origin,target)
	path_index = 0
	
func death():
	dead = true
	#set_process(false)
	#set_physics_process(false)
	$CollisionShape.disabled = true
	yield($AnimatedSprite3D, "animation_finished")
	$AnimatedSprite3D.play("die")
	
	
func shoot():
	if searching and not dead and not hitting:
		$AnimatedSprite3D.play("shoot")
		hitting = true
		yield($AnimatedSprite3D,"frame_changed")
		if ray.is_colliding():
			if ray.get_collider().is_in_group("Player"):
				PlayerStats.change_health(-damage)
		yield($AnimatedSprite3D,"animation_finished")
		hitting = false
	else:
		return


func _on_Timer_timeout():
	find_path(player.global_transform.origin)


func _on_Aural_body_entered(body):
	if body.is_in_group("Player"):
		searching = true




func _on_ShootTimer_timeout():
	if can_hit:
		shoot()





func _on_HitZone_body_entered(body):
	if body.is_in_group("Player"):
		can_hit = true
