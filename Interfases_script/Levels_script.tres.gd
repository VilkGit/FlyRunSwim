extends Control

func _ready():
	$"box_button".focus_level_button(G.number_level)

func _on_button_back_button_down():
	Audio.get_node("audio_button").play()
	pass # Replace with function body.

func _on_button_back_button_up():
	get_tree().change_scene("res://Interfaces/Interfases_scenn/Main_menu.tscn")
	pass # Replace with function body.


