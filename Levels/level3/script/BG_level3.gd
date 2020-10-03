tool

extends Node2D

export var speed_move: float = 0
var arr_node = ["Move_leyar4"]

func start():
	for i in arr_node:
		get_node(i).move = true
		get_node(i).speed += speed_move
		
func stop():
	for i in arr_node:
		get_node(i).speed = 0
	pass


