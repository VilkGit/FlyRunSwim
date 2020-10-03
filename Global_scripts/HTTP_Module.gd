extends Node

const URL_SERVER = "http://sdbgheroku.herokuapp.com"
var key_session = ""
var login = ""
var password = ""
var number_request = 0
var obj_http = HTTPWork.new(URL_SERVER, 80)

func _ready():
	print("work")
	
func url(path):
	return URL_SERVER+"/"+path
	
func check_key(obj_self=null, name_func="", text=""):
	if text != "WK":
		if obj_self: obj_self.call(name_func, text)
	else:
		HTTPUpdateKey.update_key(obj_self, name_func)
		
func check_key_dont_play_func(body):
	var text_body = body.get_string_from_utf8()
	check_key(null,"",text_body)
	
func return_headers():
	var headers = [
		"Content-Type: application/x-www-form-urlencoded",
		"Key-Session-Client:{key}".format({"key": key_session})
		]
	return headers
	
func search_headers_val_in_arr(search_header, array_headers):
	for i in len(array_headers):
		if len(array_headers[i]) < len(search_header): continue
		if slice_str(array_headers[i], 0, len(search_header)) == search_header:
			return return_val_header(array_headers[i])
			
	return null
	
func decrypt_arr_http_response(str_arr):
	var intermediate_chr_arr = ""
	for i in str_arr:
		if i == "[":
			pass
			
		elif i == "]":
			intermediate_chr_arr += "|"
			
		elif i == "'":
			pass
			
		else:
			intermediate_chr_arr += i
			
	intermediate_chr_arr = slice_str(intermediate_chr_arr, 0, len(intermediate_chr_arr)-2)
	var arr = intermediate_chr_arr.split("|")
	for i in range(1, len(arr)):
		arr[i] = slice_str(arr[i], 1)
		
	var return_arr = []
	for i in range(len(arr)):
		var intermediate_arr = arr[i].split(",")
		return_arr.append(intermediate_arr)
		
	return return_arr

func slice_str(text, start=0, stop=-1, step=1):
	if stop == -1: stop = len(text)
	var record = ""
	for i in range(start, stop, step):
		record += text[i]
		
	return record
	
func return_val_header(header):
	var id_char = -1
	for i in range(len(header)):
		if header[i] == ":":
			id_char = i
			break
			
	if id_char != -1:
		return slice_str(header, id_char+1)


