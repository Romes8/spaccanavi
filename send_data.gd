extends HTTPRequest

func Send():
	var URL = Config.URL
	var headers = ["Content-Type: application/x-www-form-urlencoded"]
	
	var http = HTTPClient.new()
	var game_focus;
	
	#change the name for the game focus
	if (Config.game_focus == "kill"):
		game_focus = "A"
	else:
		game_focus = "B"
	
	#create the data structure
	var data = {
		"entry.775212696": Config.ID,
		"entry.1734022402": game_focus,
		"entry.867234986": Config.play_time,
		"entry.47809509": Config.score_kills,
		"entry.454224439": Config.score_time,
		"entry.536978428": Config.kills,
		"entry.2007878028": Config.wave
	}
	
	## when play time is over 20 seconds send the data of not than dont send
	if (Config.play_time > 20):
		var prefil_data = http.query_string_from_dict(data)
		var prefill_url = URL + prefil_data
		yield(get_tree().create_timer(3.0), "timeout")

		OS.shell_open(prefill_url)

		print("Data sent ... ")
	else:
		print("Threshold of 20 seconds not reached. ")
