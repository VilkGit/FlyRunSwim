extends Button



func _on_button_signin_pressed():
	var url = "signin"
	var headers = ["Content-Type: application/x-www-form-urlencoded"]
	var login = $"../edit_login".text
	var password = $"../edit_password".text
	var body = "login="+login+"&"+"password="+password
	$HTTPRequest.request(G.url(url), headers, false, HTTPClient.METHOD_POST, body)	
	pass # Replace with function body.


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	if response_code == 200:
		var t_body = body.get_string_from_utf8()
		if t_body == "Login don`t exist":
			$"../Text".text = "Login don`t exist"
			
		elif t_body == "True":
			get_tree().change_scene("res://Interfaces/Interfases_scenn/Rating.tscn")
			pass
			
		elif t_body == "False":
			$"../Text".text = "Don`t right login or password"
			pass
	pass # Replace with function body.
