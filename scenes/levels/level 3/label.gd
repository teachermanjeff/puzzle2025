extends Label

# Variables for the movement countdown and points
var max_attempts: int = 10  # Maximum number of attempts
var attempts_left: int = max_attempts  # How many attempts are left
var points: int = 0  # Points the player has earned
var required_points: int = 1000  # Points required to win

# Signal to notify when the game ends
signal game_over(won)

func _ready():
	# Optionally, set up your UI to show countdown and points
	update_ui()

# Call this function every time a valid gem swap happens
func on_gem_swap_success():
	if attempts_left > 0:
		attempts_left -= 1  # Subtract one attempt
		points += 100  # You can adjust the points gain here
		update_ui()  # Update the UI every time a swap happens
		
		# Check if the player has enough points to win
		if points >= required_points:
			end_game(true)  # Player wins
	else:
		# No attempts left, game is over
		end_game(false)

# Function to update the UI (this example prints to console)
func update_ui():
	# Update your UI (for example, a label showing attempts and points)
	print("Attempts left: %d" % attempts_left)
	print("Points: %d" % points)

# Function to end the game
func end_game(won: bool):
	if won:
		print("You win!")
	else:
		print("Game over! You lose!")
	
	# Optionally, reset the game or show a menu
	get_tree().paused = true  # Pauses the game when over
	# Optionally trigger some UI to show the end state.
