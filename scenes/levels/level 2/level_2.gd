extends Node2D


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://level 2 pause.tscn")


func _on_grid_2_script_addpoints(points: Variant) -> void:
	pass # Replace with function body.
