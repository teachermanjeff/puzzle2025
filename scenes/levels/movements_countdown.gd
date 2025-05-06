extends Label

# Variables for the movement countdown and points
@export var max_attempts = 30  # Maximum number of attempts
var attempts_left # How many attempts are left
@onready var score: Label = $"../grid script/score"

func _ready():
	# Optionally, set up your UI to show countdown and points
	attempts_left = max_attempts
	update_ui()
	
	print(get_tree().current_scene.name)

func _process(delta: float) -> void:
	update_ui()

# Function to update the UI (this example prints to console)
func update_ui():
	text = str(attempts_left)
	failed()
	win()
	
func _on_grid_1_script_gemswap() -> void:
	attempts_left -= 1

func _on_grid_2_script_gemswap() -> void:
	attempts_left -= 1

func _on_grid_3_script_gemswap() -> void:
	attempts_left -= 1
	
func failed():
	if attempts_left == 0:
		get_tree().change_scene_to_file("res://scenes/menu scene/failscreen(1).tscn")

func win():		
	if score.score == 80:
		print("reached 80 score")
		globals.wonscene = str(get_tree().current_scene.name)
		get_tree().change_scene_to_file("res://scenes/menu scene/failscreen(1).tscn")
	
