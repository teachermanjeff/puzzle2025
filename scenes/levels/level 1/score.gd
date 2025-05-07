extends Label

@export var score = 0  # Maximum number of attempts
var new_score # How many attempts are left
@onready var movementscountdown: Label = $"../../Moves left 1"

func _ready():
	# Optionally, set up your UI to show countdown and points
	new_score = score
	update_ui()
	
	
func _process(delta: float) -> void:
	update_ui()
	failed()
	win()
	

# Function to update the UI (this example prints to console)
func update_ui():
	text = str(new_score)


func _on_grid_1_script_addpoints(points: Variant) -> void:
	new_score += 4
	

func _on_grid_2_script_addpoints(points: Variant) -> void:
	new_score += 4


func _on_grid_3_script_addpoints(point: Variant) -> void:
	new_score += 4
	
func failed():
	if movementscountdown.attempts_left == 0:
		get_tree().change_scene_to_file("res://scenes/menu scene/failscreen(1).tscn")

func win():		
	if new_score == 80:
		print("reached 80 score")
		globals.wonscene = str(get_tree().current_scene.name)
		get_tree().change_scene_to_file("res://scenes/menu scene/winish.tscn")
	
