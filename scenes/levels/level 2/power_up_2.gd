extends Node2D

#variables
var timer = Timer
var disappear_timer = Timer
var object_to_appear = Node
var extra_moves = Node
@onready var movesleft: Label = $"../../Moves left 1"

func _ready() -> void:
	#the time it is visible for
	timer = $"power-up Timer 2 (appear)"
	timer.wait_time = 60 # 60sec timer
	timer.one_shot = false #repeat time
	timer.start()
	
	#the time it is not visible for
	disappear_timer = $"power-up Timer 2 (disappear)"
	disappear_timer.wait_time = 10 #10sec timer
	disappear_timer.one_shot = false #repeat timer
	
	object_to_appear = $"character_power-up_animation"
	object_to_appear.visible = false #in start invisible 
	
func _on_powerup_timer_2_appear_timeout():
	object_to_appear.visible = true
	disappear_timer.start()
	movesleft.attempts_left += 5
	print("extra_moves",extra_moves)

func _on_powerup_timer_2_disappear_timeout():
	object_to_appear.visible = false
