extends Control


func show_score(score):
	$box/header_score/score.text = str(score)

func _on_button_menu_level_button_up():
	if G.number_level != G.max_num_open_level:
		get_tree().paused = false
		G.number_level += 1
		get_tree().change_scene(GR.part_levels[G.number_level])
