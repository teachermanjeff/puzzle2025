extends CanvasLayer

func _on_contd_pressed() -> void:
	if globals.wonscene == "level1":
		get_tree().change_scene_to_file("res://scenes/levels/level 2/level_2.tscn")
	if globals.wonscene == "level2":
		get_tree().change_scene_to_file("res://scenes/levels/level 3/level_3.tscn")
	if globals.wonscene == "level3":
		get_tree().change_scene_to_file("res://winscreen.tscn")

func _on_instruct_but_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/start scene/Start Screen.tscn")


func _on_instruct_but_pressed() -> void:
	
	get_tree().change_scene_to_file("res://scenes/instruction scenes/Instruction.tscn")
