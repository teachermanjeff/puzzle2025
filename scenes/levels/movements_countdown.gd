extends Label

# Variables for the movement countdown and points
@export var max_attempts = 30  # Maximum number of attempts
var attempts_left # How many attempts are left
@onready var score: Label = $"../grid 1 script/score"

func _ready():
	# Optionally, set up your UI to show countdown and points
	attempts_left = max_attempts
	update_ui()
	
	
func _process(delta: float) -> void:
	update_ui()

# Function to update the UI (this example prints to console)
func update_ui():
	text = str(attempts_left)


func _on_grid_1_script_gemswap() -> void:
	attempts_left -= 1


func _on_grid_2_script_gemswap() -> void:
	attempts_left -= 1


func _on_grid_3_script_gemswap() -> void:
	attempts_left -= 1
	
func _failed():
	if attempts_left == 0:
		get_tree().change_scene_to_file("res://scenes/menu scene/failscreen(1).tscn")
	
