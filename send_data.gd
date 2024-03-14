extends HTTPRequest

func Send():
	var URL = Config.URL
	var headers = ["Content-Type: application/x-www-form-urlencoded"]
	
	var http = HTTPClient.new()
	
	#create the data structure
	var data = {
		"entry.642001823": Config.ID,
		"entry.2057570150": Config.game_focus,
		"entry.563544572": Config.play_time,
		"entry.1471412833": Config.score_time,
		"entry.531761450": Config.score_kills,
		"entry.1203246077": Config.kills,
		"entry.14952895": Config.wave
	}

	var prefil_data = http.query_string_from_dict(data)
	var prefill_url = URL + prefil_data
	yield(get_tree().create_timer(3.0), "timeout")

	OS.shell_open(prefill_url)

	print("Data sent ... ")
