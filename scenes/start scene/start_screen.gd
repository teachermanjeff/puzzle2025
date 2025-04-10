extends Node2D


func _on_start_button_button_down() -> void:
	get_tree().change_scene_to_file("res://levels/level 1/level1.tscn")
