extends Node2D


var score:int = 0
var min_score:int = 20
var time_score:int = 0
var time_up_speed_move = 5
var speed_up = 0.2

func _ready():
	$BG_level2.start()
	$spawn_platform.start_spawn()
	$spawn_platform.rect_position.x = OS.get_window_size().x + 100
	$Audio_level2.play_mussic_fon(true)

func _on_Player_zombi_death():
	$Canvas_layer_menues.end_game(score, min_score)

func _on_timer_score_timeout():
	time_score += 1
	score += 1
	if time_score >= time_up_speed_move:
		time_score = 0
		$BG_level2.speed_move = speed_up
		$BG_level2.start()
		$spawn_platform.speed += speed_up 
		
	$Canvas_layer_menues.set_score(score)

func _on_Player_zombi_crash():
	$Audio_level2.play_audio_death()

func _on_Player_zombi_jump():
	$Audio_level2.play_audio_jump()
