extends Area



var projectile_speed = 5
var projectile_damage = 25


func deal_damage():
	var enemies = get_overlapping_bodies()
	for body in enemies:
		if body.is_in_group("Player"):
			body.take_damage(projectile_damage)


func _process(delta):
	translate(Vector3.FORWARD * projectile_speed * delta)




func _on_AvatarProjectile_body_entered(body):
	if body.is_in_group("Player"):
		return
	set_process(false)
	$AnimatedSprite3D.play("explode")
	deal_damage()
	yield($AnimatedSprite3D,"animation_finished")
	queue_free()


