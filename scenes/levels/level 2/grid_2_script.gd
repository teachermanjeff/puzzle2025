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
var matches = []
var is_updating = false
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

func _process(_delta: float) -> void:
	var matches = detect_matches()
	if spawn_gems() == is_updating:
		touch_input()
		matches.clear()
	else:
		pass
		#detect_matches() == false
	
	#print("matches detected: ", matches)
	if matches.size() > 0:
		remove_matches(matches)
		shift_gems_down()
		spawn_new_gems()
	

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

func _on_shuffle_button_pressed() -> void:
	_ready()

var first_touch = Vector2(0,0);
var final_touch = Vector2(0,0);
var controlling = false;

# Convert pixel coordinates to grid coordinates
func pixel_to_grid(pixel_x, pixel_y):
	var new_x = round((pixel_x - x_start) / offset);
	var new_y = round((pixel_y - y_start) / -offset);
	return Vector2 (new_x, new_y);
	pass;
	
func touch_input():
	if is_updating:
		return # skip input handling if the grid is being updated
		
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
func swap_pieces1(colomn, row, direction):
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
	emit_signal("gemswap") #let the movements CD know we have made a move
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

# Check if the grid coordinates are within bounds
func is_in_grid(column, row):
	if column >= 0 && column < width:
		if row >= 0 && row < height:
			return true
	return false

#Check if any gems match
func detect_matches():
	#check rows for matches (check if right beside is there simmilar gems)
	for row in range(height-1):
		for col in range(width - 3): #checks if other two gems beside it is same
			if all_gems[col][row] != null && all_gems[col][row].get_groups() == all_gems[col + 1][row].get_groups() && all_gems[col +1][row].get_groups() == all_gems[col +2][row].get_groups():
				matches.append(Vector2(col,row))
				matches.append(Vector2(col +1,row))
				matches.append(Vector2(col +2,row))
			print(all_gems[col][row].get_groups())
					
	#check rows for matches (check if right beside is there simmilar gems)				
	#for col in range(width-1):
		#print("Col is", col)
		#for row in range(height - 3):
			#print("Row is",row)
			#if all_gems[col][row] != null && all_gems[col][row].get_groups() == all_gems[col + 1][row].get_groups() && all_gems[col +1][row].get_groups() == all_gems[col +2][row].get_groups():
				#matches.append(Vector2(col,row))
				#matches.append(Vector2(col,row + 1))
				#matches.append(Vector2(col,row + 2))
				#print(all_gems[col][row].get_groups())
	return matches
	
#remove matched gems (empty the space)
func remove_matches(matches):
	for position in matches:
		var gem = all_gems[position.x][position.y]
		if gem != null:
			print("Removing gem at: ", position)
			all_gems[position.x][position.y] = null
			gem.queue_free() #gems are removed from the grid
			
func shift_gems_down():
	for col in range(width):
		for row in range(height -1, -1, -1): #start checking from bottom row
			if all_gems[col][row] == null:
				for upper_row in range(row - 1,-1, -1): #check top row
					if all_gems[col][upper_row] != null:
						all_gems[col][row] = all_gems[col][upper_row]
						all_gems[col][row].position = grid_to_pixel(col,row)
						all_gems[col][upper_row] = null
						break
#shows new gems randomly in that place						
func spawn_new_gems():
	for col in range(width-1):
		for row in range(height-1):
			if all_gems[col][row] == null:
				print("spawning new gem at: ", col, row)
				var rand = floor(randf_range(0, gems.size))
				var new_gems = gems[rand].instantiate()
				if new_gems != null:
					add_child(new_gems)
					new_gems.position = grid_to_pixel(col,row)
					all_gems[col][row] = new_gems	
				else:
					print("fail to instantiate the new gem")		
				
