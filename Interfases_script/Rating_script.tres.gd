extends Control

var arr_rating = []

func _on_button_reload_button_down():
		Audio.get_node("audio_button").play()
	
func _on_button_reload_button_up():
	$button_reload/anim_circle_load.play("anim_circle_screwup", 0)
	var url = "select_top_10"
	var headers = [
		"Content-Type: application/x-www-form-urlencoded",
		"Key-Session-Client: {key}".format({"key":HTTP.key_session})
	]
	var body = "number_level="+str(G.number_level)
	$HTTPRequest.request(HTTP.url(url), headers, false, HTTPClient.METHOD_POST, body)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var text = body.get_string_from_utf8()
	HTTP.check_key(self, "write_top_in_table", text)
	$button_reload/anim_circle_load.play("anim_circle_onshot", 0.5)
	
func write_top_in_table(text):
	arr_rating = HTTP.decrypt_arr_http_response(text)
	$table_rating.write_in_table(arr_rating)
	
func _on_button_back_button_down():
	Audio.get_node("audio_button").play()
	
func _on_button_back_button_up():
	get_tree().change_scene("res://Interfaces/Interfases_scenn/Main_menu.tscn")
	pass # Replace with function body.





