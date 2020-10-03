extends Area2D



func _on_Area_run_body_entered(body):
	body.emit_signal("run")
	pass # Replace with function body.
