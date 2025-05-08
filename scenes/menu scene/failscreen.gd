extends Control

func _on_restart_1_pressed() -> void:
	if globals.failedscene == "Level 1":
		get_tree().change_scene_to_file("res://scenes/levels/level 1/level1.tscn")
	if globals.failedscene == "Level 2":
		get_tree().change_scene_to_file("res://scenes/levels/level 2/level_2.tscn")
	if globals.failedscene == "Level 3":
		get_tree().change_scene_to_file("res://scenes/levels/level 3/level_3.tscn")
	


func _on_main_but_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu scene/MENU.tscn")
	

func _on_instruct_but_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/instruction scenes/Instruction.tscn")
