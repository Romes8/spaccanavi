extends HTTPRequest

func Send():
	var URL = Config.URL
	var headers = ["Content-Type: application/x-www-form-urlencoded"]
	
	var http = HTTPClient.new()
	
	#create the data structure
	var data = {
		"entry.2057570150": Config.game_focus,
		"entry.563544572": Config.play_time,
		"entry.1471412833": Config.score_time,
		"entry.531761450": Config.score_kills,
		"entry.1203246077": Config.kills,
		"entry.14952895": Config.wave
	}

	data = http.query_string_from_dict(data)
	
	var result = request(URL, headers, false, HTTPClient.METHOD_POST, data)

	print("Data sent ... ")
