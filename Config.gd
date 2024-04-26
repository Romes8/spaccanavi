extends Node


# data values that we inceremnt, track and export after each game
var score_time = 0
var score_kills = 0
var kills = 0
var wave = 0
var ID = null
var play_time = 0
var retries = 0
var cur_time = 0

#we store ID in this file. 
#if time is selected ID form is: T<NUMBER>
#if kill is selected ID form is: K<NUMBER>
#var uid_file_path = "res://uid.txt"  

# this decides what game type we launch
# if time is selected we focus on time score
# if kill is selected we focus on kill score
#var game_focus = "kill"  
var game_focus = "time"
var reset = false
#Link to Google forms
var URL = "https://docs.google.com/forms/d/e/1FAIpQLSeU8w0HWVNsB7p8nidEaqqICrYkTCKqsVJ_pHxNvhT-LaHd5w/viewform?"

func WriteToFile():
	var file_name
	var focus
	
	#get the right file name
	if (game_focus == "kill"):
		file_name = "data_logs_A.csv"
		focus = "A"
	else:
		file_name = "data_logs_B.csv"
		focus = "B"
		
	var data = str(ID) + "," + str(cur_time) + "," + focus + "," + str(score_time) + "," + str(score_kills) + "," + str(kills) + "," + str(play_time) + "," + str(wave) + "," + str(retries)
	var file = File.new()
	
	if not file.file_exists(file_name):
		file.open(file_name, File.WRITE)
		file.store_string("ID,cur_time,game_focus,score_time,score_kills,kills,play_time,wave,retries" + "\n")
		file.close()

	file.open(file_name, File.READ_WRITE)
	file.seek_end()
	if (ID != null): # do not save empty log
		file.store_string(str(data) + "\n")
	file.close()
	
	print("Game data saved ... ")

func Retry():
	if !reset:
		
		#Save the game data into file
		WriteToFile()
		
		score_time = 0
		score_kills = 0
		kills = 0
		wave = 0
		play_time = 0
		retries += 1
		
		print("Retrying game...")
	else:
		ID = null
		reset = false  # this is when questionaire was send. We dont want to trigger retrying game func



func ResetData():

	#Save the game data into file
	WriteToFile()
	
	score_time = 0
	score_kills = 0
	kills = 0
	ID = null
	wave = 0
	play_time = 0
	retries = 0 
	
	print("Data reseted...")
	
	reset = true
