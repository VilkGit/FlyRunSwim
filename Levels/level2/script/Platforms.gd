extends KinematicBody2D

export var move:float

func move_platform(delta):
	move_and_collide(Vector2(-move, 0) * delta * 100)
	
	if global_position.x + $Sprite.texture.get_size().x <= 0:
		queue_free()
		
func _physics_process(delta):
	move_platform(delta)
	

func _on_Area_crash_body_entered(body):
	body.emit_signal("crash")
	pass # Replace with function body.
