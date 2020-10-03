extends Node2D

var score:int = 0
var min_score:int = 5
var time_score:int = 0
var time_up_speed_move = 1
var speed_up:float = 0.0125

func _ready():
	$BG_level3.start()
	$spawn_pad_death_platform.rect_position.x = OS.get_window_size().x + 100
	$spawn_pad_death_platform.start_spawn()
	$spawn_stone_platform.rect_position.x = OS.get_window_size().x + 100
	$spawn_stone_platform.start_spawn()
	
	$Audio_level3.play_mussic_fon(true)

func _on_timer_score_timeout():
	time_score += 1
	score += 1
	if time_score >= time_up_speed_move and score < 400:
		time_score = 0
		$BG_level3.speed_move = speed_up
		$BG_level3.start()
		$Playar_astronaut.speed_bg += speed_up
		$spawn_pad_death_platform.speed += speed_up 
		$spawn_stone_platform.speed += speed_up 
		
	$Canvas_layer_menues.set_score(score)

func _on_Playar_astronaut_death():
	$Canvas_layer_menues.end_game(score, min_score)
	pass # Replace with function body.
