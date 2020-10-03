extends KinematicBody2D

signal run
signal jump
signal crash
signal death

export var speed_bg:float

var speed_jump = 15
var jump = Vector2(0, speed_jump)
var die = false 

func _ready():
	connect("jump", self, "jump_player")
	connect("run", self, "run_player")
	connect("crash", self, "death_player")

func death_player():
	$".".pause_mode = Node.PAUSE_MODE_PROCESS
	get_tree().paused = true
	jump.y = speed_jump
	$sprite.flip_v = false
	die = true
	$sprite/anim.play("death")

func jump_player():
	if jump.y > 0:
		$sprite.flip_v = false
	else:
		$sprite.flip_v = true

func play_audio_run():
	if jump.y > 0:
		$sprite/audio_step_ground_1.pitch_scale = 1
		$sprite/audio_step_ground_2.pitch_scale = 1
		$sprite/audio_step_iron_1.pitch_scale = 0.01
		$sprite/audio_step_iron_2.pitch_scale = 0.01
	else:
		$sprite/audio_step_ground_1.pitch_scale = 0.01
		$sprite/audio_step_ground_2.pitch_scale = 0.01
		$sprite/audio_step_iron_1.pitch_scale = 1
		$sprite/audio_step_iron_2.pitch_scale = 1

func run_player():
	$sprite/anim.play("run",-1, speed_bg / 5)
	play_audio_run()
	if $sprite.flip_v:
		$shape2.rotation_degrees *= -1 

func control_player(event):
	if event is InputEventScreenTouch:
		if event.pressed and not die:
			$sprite/anim.play("jump")
			if jump.y > 0:
				jump.y = -speed_jump
			else:
				jump.y = speed_jump
		pass
		
func _physics_process(delta):
	move_and_collide(jump)
	pass

func _on_anim_animation_started(anim_name):
	if anim_name == "jump":
		pass
		
func _on_anim_animation_finished(anim_name):
	if anim_name == "death":
		emit_signal("death")
