extends Node2D

# grid variables
@export var width: int
@export var height: int
@export var x_start: int
@export var y_start: int
@export var offset: int
signal gemswap

# gem array
var all_gems = []
var gems = [
	preload("res://scenes/gem scenes/blue_gem.tscn"),
	preload("res://scenes/gem scenes/light_green_gem.tscn"),
	preload("res://scenes/gem scenes/yellow_gem.tscn"),
	preload("res://scenes/gem scenes/red_gem.tscn"),
	preload("res://scenes/gem scenes/purple_gem.tscn")
]

func _ready():
	randomize()
	all_gems = make_2D_array()
	spawn_gems()

# Create a 2D array for all the gems
func make_2D_array() -> Array:
	var array = []
	for i in range(width): 
		array.append([])
		for j in range(height):  
			array[i].append(null)
	return array

# Spawn gems at the grid positions
func spawn_gems():
	for j in range(height):  
		for i in range(width):  # added loop over width
			var rand = floor(randf_range(0, gems.size()))
			var piece = gems[rand].instantiate()
			
			# Check if the piece is valid (not Nil)
			if piece != null:
				add_child(piece)
				piece.position = grid_to_pixel(i, j)
				all_gems[i][j] = piece  # Store the gem in the array at the grid position
			else:
				print("Error: Piece not instantiated correctly.")
				
# Convert grid coordinates to pixel coordinates
func grid_to_pixel(column, row):
	var new_x = x_start + offset * column
	var new_y = y_start + -offset * row
	return Vector2(new_x, new_y)


	
var first_touch = Vector2(0,0);
var final_touch = Vector2(0,0);
var controlling = false;

# Convert pixel coordinates to grid coordinates
func pixel_to_grid(pixel_x, pixel_y):
	var new_x = round((pixel_x - x_start) / offset);
	var new_y = round((pixel_y - y_start) / -offset);
	return Vector2 (new_x, new_y);
	pass;
	
func _on_shuffle_button_1_pressed() -> void:
	_ready()

	
func touch_input():
	if Input.is_action_just_pressed("ui_touch"):
		first_touch = get_global_mouse_position()
		var grid_position = pixel_to_grid(first_touch.x, first_touch.y)
		if is_in_grid(grid_position.x, grid_position.y):
			controlling = true;
			
	if Input.is_action_just_released("ui_touch"):
		final_touch = get_global_mouse_position();
		var grid_position = pixel_to_grid(final_touch.x, final_touch.y);
		if is_in_grid(grid_position.x, grid_position.y):
			touch_difference(pixel_to_grid(first_touch.x, first_touch.y), grid_position);
			controlling = false;
func swap_pieces(colomn, row, direction):
	emit_signal("gemswap")
	var first_piece = all_gems[colomn][row];
	var other_piece = all_gems[colomn+ direction.x][row+ direction.y];
	all_gems[colomn][row]=other_piece;
	all_gems[colomn+direction.x][row+direction.y]=first_piece;
	first_piece.position = grid_to_pixel(colomn+direction.x, row+direction.y);
	other_piece.position = grid_to_pixel(colomn, row);
	
	if Input.is_action_just_released("ui_touch"):
		final_touch = get_global_mouse_position()
		var grid_position = pixel_to_grid(final_touch.x, final_touch.y)
		if is_in_grid(grid_position.x, grid_position.y):
			touch_difference(pixel_to_grid(first_touch.x, first_touch.y), grid_position)
			controlling = false

# Swap the positions of two pieces on the grid
func swap_pieces(column, row, direction):
	var first_piece = all_gems[column][row]
	var other_piece = all_gems[column + direction.x][row + direction.y]
	
	# Check if both pieces are valid (not Nil)
	if first_piece != null and other_piece != null:
		all_gems[column][row] = other_piece
		all_gems[column + direction.x][row + direction.y] = first_piece
		
		first_piece.position = grid_to_pixel(column + direction.x, row + direction.y)
		other_piece.position = grid_to_pixel(column, row)
	else:
		print("Error: One or both pieces are Nil.")

# Handle touch input differences to swap pieces
func touch_difference(grid_2, grid_1):
	var difference = grid_2 - grid_1
	if abs(difference.x) > abs(difference.y):
		if difference.x > 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(1, 0))
		elif difference.x < 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(-1, 0))
	elif abs(difference.y) > abs(difference.x):
		if difference.y > 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(0, 1))
		elif difference.y < 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(0, -1))

func _process(_delta):
	touch_input()

# Check if the grid coordinates are within bounds
func is_in_grid(column, row):
	if column >= 0 && column < width:
		if row >= 0 && row < height:
			return true
	return false
