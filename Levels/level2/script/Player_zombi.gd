extends KinematicBody2D

signal crash
signal death
signal run
signal jump

var move = Vector2()
var gravity = 2

var jump_active:bool = false
var jump_height = 30
var max_height = 400
var tuch_ground:bool = true
var dont_move:bool = false

func _ready():
	connect("crash", self, "death_player")
	connect("run", self, "run_player")

func death_player():
	$sprite/anim.pause_mode = Node.PAUSE_MODE_PROCESS
	get_tree().paused = true
	dont_move = true
	$sprite/anim.play("death")
	
func _on_anim_animation_finished(anim_name):
	if anim_name == "death":
		emit_signal("death")
		pass
	if anim_name == "jump_start":
		$sprite/anim.play("jump_loop")

func run_player():
	if not dont_move:
		tuch_ground = true
		$sprite/anim.play("run")
	pass

func control_player(event):
	if event is InputEventScreenTouch:
		if event.pressed and not dont_move:
			jump_active = true
			if tuch_ground: emit_signal("jump")
			
		else:
			jump_active = false
			tuch_ground = false
			
func _physics_process(delta):
	if position.y < max_height:
		tuch_ground = false
		
	if jump_active and tuch_ground:

		$sprite/anim.play("jump_start")
		move.y = -jump_height * delta * 50
	else:
		if move.y < 100:
			move.y += 1
	
	move_and_collide(move)
