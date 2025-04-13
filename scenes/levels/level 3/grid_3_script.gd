extends Node2D

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

func _ready():
	randomize()
	all_gems = make_2D_array()
	spawn_gems()

func make_2D_array() -> Array:
	var array = []
	for i in range(width): 
		array.append([])
		for j in range(height):  
			array[i].append(null)
	return array

func spawn_gems():
	for j in range(height):  
		for i in range(width): # added loop over width
			var rand = floor(randf_range(0, gems.size()))
			var piece = gems[rand].instantiate()
			add_child(piece)	
			piece.position = grid_to_pixel(i, j)

func grid_to_pixel(column, row):
	var new_x = x_start + offset * column
	var new_y = y_start + -offset * row
	return Vector2(new_x, new_y)
