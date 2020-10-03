extends Control

signal reload_rating

func _ready():
	connect("reload_rating", self, "update_rating")
	
func update_rating(arr):
	if arr:
		for i in range(len(arr)):
			for j in range(len(arr[i])):
				$"../ItemList".add_item(str(arr[i][j]))
#			var text = "{number}: {name} | {score} | {date}".format(
#				{"number":i+1, "name":arr[i][0], "score":arr[i][1], "date":arr[i][2]})
			
#			get_node("record{i}".format({"i":i+1})).text = text
	
	else:
		pass # if arr is empty, add code 