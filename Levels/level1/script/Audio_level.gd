extends Node2D

export var mussic_fon:AudioStream
export var audio_death:AudioStream

var play_mussic_fon

func _ready():
	$mussic_fon.stream = mussic_fon
	$audio_death.stream = audio_death
	
func play_mussic_fon(vall:bool):
	if vall:
		$mussic_fon.play()
		play_mussic_fon = true
	else:
		play_mussic_fon = false
		
func play_audio_death():
	$audio_death.play()

func _on_mussic_fon_finished():
	if play_mussic_fon:
		$mussic_fon.play()
	pass # Replace with function body.
