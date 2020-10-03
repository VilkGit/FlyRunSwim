extends Control

var login = ""
var password = ""
var check_log_pass = load("res://Interfaces/Interfases_script/ClassCheckLoginPass.gd")
var checkLP = check_log_pass.new()

func _ready():
	get_tree().paused = false

func _on_signin_button_down():
	Audio.get_node("audio_button").play()
	pass # Replace with function body.
func _on_signin_button_up():
	login = $"edit_login".text
	password = $"edit_password".text
	$"text".text = ""
	if checkLP.check_login_on_char(login):
		if checkLP.check_login_on_len(login):
			if checkLP.check_password_on_char(password):
				if checkLP.check_password_on_len(password):
					
					$circle_load.visible = true
					$circle_load/anim_circle_load.play("anim_circle_screwup")
					
					var url_patch = "signin"
					var headers = [
							"Content-Type: application/x-www-form-urlencoded",
							]
					var body = "login={login}&password={password}".format({"login":login, "password":password})
					$HTTPRequest.request(HTTP.url(url_patch), headers, false, HTTPClient.METHOD_POST, body)
					
				else:
					$"text".text = "Длина пароля должна быть более 6 символов. "
			else:
				$"text".text = """Пароль может состоять только из латинских символов,
				цыфр и символов нижнего и верхнего регистра"""
		else:
			$"text".text = "Длина логина должна быть более 5 символов. "
	else:
		$"text".text = """Логин может состоять только из латинских символов,
		цыфр и символов нижнего и верхнего регистра"""

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	if response_code == 200:
		var t_body = body.get_string_from_utf8()
		if t_body == "True":
			HTTP.key_session = HTTP.search_headers_val_in_arr("Key-Session-Server", headers)
			G.max_num_open_level = int(HTTP.search_headers_val_in_arr("Max-Number-Level", headers))
			HTTP.login = login
			HTTP.password = password
			get_tree().change_scene("res://Interfaces/Interfases_scenn/Main_menu.tscn")

		elif t_body == "False":
			$"text".text = "Не верный логин или пароль"
			
		$circle_load/anim_circle_load.play("anim_circle_onshot")
		$circle_load.visible = false
			
func _on_signup_button_down():
	Audio.get_node("audio_button").play()
	pass # Replace with function body.
func _on_signup_button_up():
	
	get_tree().change_scene("res://Interfaces/Interfases_scenn/Signup.tscn")







