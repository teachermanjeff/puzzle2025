extends Button

func _ready():
	pass
	
func _process(delta):
	pass
	

func _on_button_down():
	get_tree().change_scene_to_file("res://scenes/instruction scenes/go_back.gd")
