extends Node2D

export var val_emitting:bool = true

func _ready():
	change_emitting(val_emitting)
	change_texture_partical(GR.levels_partical_textures[
		"level{nl}".format({"nl":G.number_level})])

func check_emitting():
	return $partical.emitting

func change_emitting(val:bool):
	$partical.emitting = val
	
func change_texture_partical(patch_texture):
	$partical.set_texture(patch_texture)