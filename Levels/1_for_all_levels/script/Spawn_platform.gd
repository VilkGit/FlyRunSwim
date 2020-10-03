extends Control

export var arr_platform_obj: Array
export var time_spawn: float
export var speed: float

var rng = RandomNumberGenerator.new()
var id_platform = 0
var position_platform = Vector2()
var time_value:float = 0

func start_spawn():
	$Timer.start()
	
func stop_spawn():
	$Timer.stop()

func random_id_platform():
	rng.randomize()
	id_platform = rng.randi_range(0, len(arr_platform_obj) - 1)

func random_position_platform():
	rng.randomize()
	position_platform.x = rng.randi_range(0, rect_size.x)
	position_platform.y = rng.randi_range(0, rect_size.y)
	
func spawn_platform():
	random_id_platform()
	random_position_platform()
	var obj = arr_platform_obj[id_platform].instance()
	obj.position = position_platform
	obj.move = speed
	add_child(obj)


func _on_Timer_timeout():
	if time_value >= time_spawn and time_spawn != 0:
		time_value = 0
		spawn_platform()
	else:
		time_value += 0.1
	pass # Replace with function body.
