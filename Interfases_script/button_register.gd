extends Button




func _on_button_register_pressed():
	var url = "signup"
	var headers = ["Content-Type: application/x-www-form-urlencoded"]
	var login = $"../edit_login".text
	var password = $"../edit_password".text
	var body = "login="+login+"&"+"password="+password
	$HTTPRequest.request(G.url(url), headers, false, HTTPClient.METHOD_POST, body)	


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	if response_code == 200:
		G.key_session = headers["Key_session_server"]
		var t_body = body.get_string_from_utf8()
		$"../Text".text = t_body
	pass # Replace with function body.

