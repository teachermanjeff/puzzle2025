extends Button

func _on_button_down():
	if globals.instruction == "Start Screen":
		get_tree().change_scene_to_file("res://scenes/start scene/Start Screen.tscn")
	if globals.instruction == "Level 1":
		get_tree().change_scene_to_file("res://scenes/levels/level 1/level1.tscn")
	if globals.instruction == "Level 2":
		get_tree().change_scene_to_file("res://scenes/levels/level 2/level_2.tscn")
	if globals.instruction == "Level 3":
		get_tree().change_scene_to_file("res://scenes/levels/level 3/level_3.tscn")
