extends Control


func _on_quit_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/menu scene/MENU.tscn")
	


func _on_restart_button_down() -> void:
	get_tree().change_scene_to_file("res://levels/level 1/level1.tscn")
