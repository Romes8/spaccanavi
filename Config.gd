extends Node


# data values that we inceremnt, track and export after each game
var score_time = 0
var score_kills = 0
var kills = 0
var wave = 0
var ID = null
var play_time = 0
var retries = 0

#we store ID in this file. 
#if time is selected ID form is: T<NUMBER>
#if kill is selected ID form is: K<NUMBER>
#var uid_file_path = "res://uid.txt"  

# this decides what game type we launch
# if time is selected we focus on time score
# if kill is selected we focus on kill score
var game_focus = "time"  
#var game_focus = "kill"
var reset = false
#Link to Google forms
var URL = "https://docs.google.com/forms/d/e/1FAIpQLSeU8w0HWVNsB7p8nidEaqqICrYkTCKqsVJ_pHxNvhT-LaHd5w/viewform?"


func Retry():
	
	if !reset:
		
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
	score_time = 0
	score_kills = 0
	kills = 0
	ID = null
	wave = 0
	play_time = 0
	retries = 0 
	
	print("Data reseted...")
	
	reset = true
