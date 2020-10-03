tool
extends TextureButton

export var texture_text_N:Texture
export var texture_normal_N:Texture
export var texture_pressed_N:Texture

func _ready():
	$texture_text.texture = texture_text_N
	texture_normal = texture_normal_N
	texture_pressed = texture_pressed_N
func _physics_process(delta):
	if Engine.editor_hint:
		$texture_text.texture = texture_text_N
		texture_normal = texture_normal_N
		texture_pressed = texture_pressed_N

func _on_button_menu_level_button_down():
	Audio.play_audio_button()
	pass # Replace with function body.
