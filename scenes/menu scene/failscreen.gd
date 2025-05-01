extends Control


func _on_contd_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/start scene/Start Screen.tscn")


func _on_instruct_but_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu scene/MENU.tscn")
