extends Control

func _ready():
	chenge_texture_audio_button()
	chenge_texture_mussic_button()

func _on_audio_button_pressed():
	Audio.onoff_audio_button()
	chenge_texture_audio_button()

func _on_mussic_button_pressed():
	Audio.onoff_audio_mussic()
	chenge_texture_mussic_button()

func chenge_texture_audio_button():
	if Audio.audio_button_on:
		$audio_button.set_normal_texture(GR.audio_button_textures["audio_button_on"])
	else:
		$audio_button.set_normal_texture(GR.audio_button_textures["audio_button_off"])

func chenge_texture_mussic_button():
	if Audio.audio_mussic_on:
		$mussic_button.set_normal_texture(GR.audio_button_textures["mussic_button_on"])
	else:
		$mussic_button.set_normal_texture(GR.audio_button_textures["mussic_button_off"])


