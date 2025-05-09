extends Node2D

var pausescreen = preload("res://scenes/menu scene/MENU.tscn")

func _on_button_button_down() -> void:
	var newpausescreen = pausescreen.instantiate()
	add_child(newpausescreen)


func _on_grid_2_script_addpoints(points: Variant) -> void:
	pass # Replace with function body.
