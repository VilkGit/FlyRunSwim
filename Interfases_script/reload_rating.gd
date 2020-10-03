extends Button



func _on_reload_rating_pressed():
	var url = "select_top_10"
	var headers = ["Content-Type: application/x-www-form-urlencoded"]
	var body = "number_level="+str(G.number_level)
	$HTTPRequest.request(G.url(url), headers, false, HTTPClient.METHOD_POST, body)	
	pass # Replace with function body.


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	$"../box_rating/text".text = body.get_string_from_utf8()
	pass # Replace with function body.
