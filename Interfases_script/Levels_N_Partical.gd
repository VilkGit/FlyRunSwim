extends Control

signal select_level

var timer_val:int = 0
var max_time_wait:int = 6
var wait_change:bool = true
var number_level:int = 0

func _ready():
	connect("select_level", self, "select_level")

func change_partical(number_level):
	var rec_texture_partical = GR.levels_partical_textures["level{nl}".format(
			{"nl":number_level})]
	if $partical1_bg.check_emitting():
		$partical2_bg.change_texture_partical(rec_texture_partical)
		$partical1_bg.change_emitting(false)
		$partical2_bg.change_emitting(true)
		
	else:
		$partical1_bg.change_texture_partical(rec_texture_partical)
		$partical2_bg.change_emitting(false)
		$partical1_bg.change_emitting(true)

func select_level(number_level):
	if wait_change:
		wait_change = false
		self.number_level = number_level
		change_partical(number_level)
		$timer.start()

func _on_timer_timeout():
	timer_val += 1
	if timer_val >= max_time_wait:
		$timer.stop()
		timer_val = 0
		wait_change = true
		if self.number_level != G.number_level: select_level(G.number_level)





