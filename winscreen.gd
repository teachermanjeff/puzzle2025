extends Control

func _on_main_menu_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/start scene/Start Screen.tscn")


func _on_instruct_but_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/instruction scenes/Instruction.tscn")
