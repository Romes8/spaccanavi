extends Node

var minutes = 0
var seconds = 0

func process():
	minutes = Config.play_time / 60
	seconds = Config.play_time % 60
	
	print("")
	print("-- GAME STATS -- ")
	print("Game focus: ", Config.game_focus)
	print("Play time: "  + str(minutes)+ ":" + str(seconds))
	print("Time score: " + str(Config.score_time))
	print("Kill score: " + str(Config.score_kills))
	print("Kills: " + str(Config.kills))
	print("Waves: " + str(WaveManager.current_wave))
	print("")
	
	#export the data
