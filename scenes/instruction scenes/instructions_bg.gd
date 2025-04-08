extends ColorRect

func _ready():
	pass
	
func _process(delta):
	pass


func _on_mouse_entered():
	get_tree().change_scene_to_file("res://Instruction.tscn")
