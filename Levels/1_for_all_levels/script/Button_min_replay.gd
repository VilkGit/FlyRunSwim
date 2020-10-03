extends Control

func _on_button_menu_level_button_up():
	get_tree().paused = false
	get_tree().reload_current_scene()
	pass # Replace with function body.
