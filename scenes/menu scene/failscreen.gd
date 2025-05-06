extends Control

func _on_restart_1_pressed() -> void:
	get_tree().change_scene_to_file(globals.failedscene)


func _on_main_but_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu scene/MENU.tscn")
	

func _on_instruct_but_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/instruction scenes/Instruction.tscn")
