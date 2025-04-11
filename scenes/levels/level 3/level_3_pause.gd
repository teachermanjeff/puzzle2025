extends Control




func _on_quit_lvl_3_button_down() -> void:
		get_tree().change_scene_to_file("res://scenes/menu scene/MENU.tscn")




func _on_restart_lvl_3_button_down() -> void:
	get_tree().change_scene_to_file("res://levels/level 3/level_3.tscn")
