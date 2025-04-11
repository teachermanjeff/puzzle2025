extends Control





func _on_quitlvl_2_button_down() -> void:
		get_tree().change_scene_to_file("res://scenes/menu scene/MENU.tscn")



func _on_restartlvl_2_button_down() -> void:
	get_tree().change_scene_to_file("res://levels/level 2/level_2.tscn")
