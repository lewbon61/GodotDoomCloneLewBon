extends Area
export (int) var health_var =30

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HealthPickup_body_entered(body):
	if body.is_in_group("Player"):
		PlayerStats.change_health(health_var)
		queue_free()
