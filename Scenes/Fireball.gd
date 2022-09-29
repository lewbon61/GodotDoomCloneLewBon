extends Area

var fireball_speed = 15
var fireball_damage = 5


func deal_damage():
	var enemies = get_overlapping_bodies()
	for body in enemies:
		if body.is_in_group("Enemy"):
			body.take_damage(fireball_damage)


func _process(delta):
	translate(Vector3.FORWARD * fireball_speed * delta)


func _on_Fireball_body_entered(body):
	if body.is_in_group("Player"):
		return
	set_process(false)
	$AnimatedSprite3D.play("explode")
	deal_damage()
	yield($AnimatedSprite3D,"animation_finished")
	queue_free()

