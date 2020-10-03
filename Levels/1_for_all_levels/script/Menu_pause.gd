extends Control

func _on_button_contiue_button_up():
	get_tree().paused = false
	visible = false
	pass # Replace with function body.

func _on_button_main_menu_button_up():
	get_tree().change_scene("res://Interfaces/Interfases_scenn/Main_menu.tscn")
	pass # Replace with function body.

func _on_button_exit_button_up():
	get_tree().quit()
	pass # Replace with function body.
