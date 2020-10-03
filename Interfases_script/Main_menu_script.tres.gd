extends Control

func _ready():
	get_tree().paused = false
	Audio.onoff_audio_mussic_main_menu(true)
	if not Audio.get_node("audio_fone").is_playing():
		Audio.get_node("audio_fone").play()
	OS.set_screen_orientation(5)
	

func _on_button_game_button_down():
	Audio.get_node("audio_button").play()
	pass # Replace with function body.

func _on_button_game_button_up():
	OS.set_screen_orientation(4)
	get_tree().change_scene(GR.part_levels[G.number_level])
	pass # Replace with function body.

func _on_button_levels_button_down():
	Audio.get_node("audio_button").play()
	pass # Replace with function body.
	
func _on_button_levels_button_up():
	get_tree().change_scene("res://Interfaces/Interfases_scenn/Levels.tscn")
	pass # Replace with function body.

func _on_button_rating_button_down():
	Audio.get_node("audio_button").play()
	pass # Replace with function body.

func _on_button_rating_button_up():
	get_tree().change_scene("res://Interfaces/Interfases_scenn/Rating.tscn")
	pass # Replace with function body.

func _on_button_exit_button_down():
	Audio.get_node("audio_button").play()
	pass # Replace with function body.

func _on_button_exit_button_up():
	get_tree().quit()
	pass # Replace with function body.










