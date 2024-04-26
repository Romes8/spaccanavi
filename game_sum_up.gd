extends Node

var minutes = 0
var seconds = 0

func process():
	Config.wave = WaveManager.current_wave
	minutes = Config.play_time / 60
	seconds = Config.play_time % 60
	
	#createUnique ID
	var timestamp = OS.get_unix_time()
	var datetime = Time.get_datetime_dict_from_unix_time(OS.get_unix_time())

	var formatted_time = String(datetime["year"]) + "-" + \
						 String(datetime["month"]).pad_zeros(2) + "-" + \
						 String(datetime["day"]).pad_zeros(2) + " " + \
						 String(datetime["hour"]).pad_zeros(2) + ":" + \
						 String(datetime["minute"]).pad_zeros(2) + ":" + \
						 String(datetime["second"]).pad_zeros(2)
	Config.cur_time = formatted_time
	
	randomize()
	var random_value = randi() % 100 + 100 # Generate a random integer between 100 - 199
	
	#generate new UID when its empty
	if (Config.ID == null):
		Config.ID = "uid_" + str(timestamp) + "_" + str(random_value)
	
	print("")
	print("-- GAME STATS -- ")
	print("Current date and time: ", Config.cur_time)
	print("ID: ", Config.ID)
	print("Game focus: ", Config.game_focus)
	print("Play time: "  + str(minutes)+ ":" + str(seconds))
	print("Time score: " + str(Config.score_time))
	print("Kill score: " + str(Config.score_kills))
	print("Kills: " + str(Config.kills))
	print("Waves: " + str(Config.wave))
	print("Retries : " + str(Config.retries))
	print("")
	
	#export the data
	#SendData.Send()

	#clear the data
	#Config.score_kills = 0
	#Config.score_time = 0 
	#Config.kills = 0
