extends Button

export(String, FILE) var next_scene_path: = ""

func _on_button_up() -> void:
	Engine.time_scale = 1
	WaveManager.initialize()
	#AudioManager.initialize()

	
	get_tree().paused = false
	SendData.Send()
	
	yield(get_tree().create_timer(3.0), "timeout")  #timer to wait for 3 seconds 
	get_tree().change_scene(next_scene_path)
	AudioManager.stop()
