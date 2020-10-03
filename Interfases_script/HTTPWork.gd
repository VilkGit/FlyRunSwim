extends Node

class_name HTTPWork
var HTTP_obj = HTTPClient.new()
var host
var port

func _init(host, port):
	self.host = host
	self.port = port
	
func request(url, headers, method, body):
	HTTP_obj.connect_to_host(self.host, self.port)
	HTTP_obj.request(method, url, headers, body)
	var text = HTTP_obj.read_response_body_chunk()
	print(text.get_string_from_utf8())