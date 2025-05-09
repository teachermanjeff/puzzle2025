extends CanvasLayer


func _on_contd_pressed() -> void:
	queue_free()


func _on_instruct_but_pressed() -> void:
	globals.instruction = str(get_tree().current_scene.name)
	get_tree().change_scene_to_file("res://scenes/instruction scenes/Instruction.tscn")
	


func _on_startscreen_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/start scene/Start Screen.tscn")
