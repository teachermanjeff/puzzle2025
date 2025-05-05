extends Label

@export var score = 0  # Maximum number of attempts
var new_score # How many attempts are left


func _ready():
	# Optionally, set up your UI to show countdown and points
	new_score = score
	update_ui()
	
	
func _process(delta: float) -> void:
	update_ui()

# Function to update the UI (this example prints to console)
func update_ui():
	text = str(new_score)


func _on_grid_1_script_addpoints(points: Variant) -> void:
	new_score += 4
	

func _on_grid_2_script_addpoints(points: Variant) -> void:
	new_score += 4


func _on_grid_3_script_addpoints(point: Variant) -> void:
	new_score += 4
	

	
