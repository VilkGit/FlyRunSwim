extends Control

onready var PATCH_PARTICAL = $"../particals_bg"

func _ready():
	open_levels(G.max_num_open_level)
	print(G.max_num_open_level)
	pass
	
func open_levels(max_num_open_level:int):
	for i in range(1, max_num_open_level+1):
		get_node("button_level{nl}/close".format({"nl":i})).visible = false
	
func focus_level_button(num_level:int):
	var patch_node_last_button = get_node("button_level{nl}/fockus".format(
			{"nl":G.number_level}))
	var patch_node_now_button = get_node("button_level{nl}/fockus".format(
			{"nl":num_level}))
	patch_node_last_button.visible = false
	patch_node_now_button.visible = true
	
func write_number_level(num_level:int):
	if not get_node("button_level{nl}/close".format({"nl":num_level})).visible:
		if G.number_level != num_level:
			focus_level_button(num_level)
			G.number_level = num_level
			PATCH_PARTICAL.emit_signal("select_level", num_level)




func _on_button_level1_pressed():
	write_number_level(1)

func _on_button_level2_pressed():
	write_number_level(2)

func _on_button_level3_pressed():
	write_number_level(3)


