@export var width: int
@export var height: int
@export var x_start: int
@export var y_start: int
@export var offset: int

var all_gems = []
var gems = [
	preload("res://scenes/gem scenes/blue_gem.tscn"),
	preload("res://scenes/gem scenes/light_green_gem.tscn"),
	preload("res://scenes/gem scenes/yellow_gem.tscn"),
	preload("res://scenes/gem scenes/red_gem.tscn"),
	preload("res://scenes/gem scenes/purple_gem.tscn")
]

func _on_button_down() -> void:
	randomize()
	all_gems = make_2D_array()
	spawn_gems()
	shuffle_gems()
	
func make_2D_array() -> Array:
	var array = []
	for i in range(width): 
		array.append([])
		for j in range(height):  
			array[i].append(null)
	return array

func spawn_gems():
	var parent_node = get_parent()
	
	if parent_node == null:
		print("Parent node is not found. Trying to add gems to the root.")
		parent_node = get_tree().root  # Or specify a different root if needed
		
	for j in range(height):
		for i in range(width):
			var rand = floor(randf_range(0, gems.size()))
			var piece = gems[rand].instantiate() 
			parent_node.add_child(piece) 
			piece.position = grid_to_pixel(i, j) 
			all_gems[i][j] = piece

func grid_to_pixel(column, row):
	var new_x = x_start + offset * column
	var new_y = y_start + -offset * row
	return Vector2(new_x, new_y)
	
func shuffle_gems():
	var gem_instances = []
	
	for j in range(height):
		for i in range(width):
			if all_gems[i][j] != null:
				gem_instances.append(all_gems[i][j])
				
	gem_instances.shuffle()
				
	var index = 0
	for j in range(height):
		for i in range(width):
			if all_gems[i][j] != null:
				var piece = gem_instances[index] 
				piece.position = grid_to_pixel(i, j)  
				index += 1
							
