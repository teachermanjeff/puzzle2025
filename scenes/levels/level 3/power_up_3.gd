extends Node2D

#variables
var timer = Timer
var disappear_timer = Timer
var object_to_appear =Node

func _ready() -> void:
	#the time it is visible for
	timer = $"power-up Timer 3 (appear)"
	timer.wait_time = 120 # 120sec timer
	timer.one_shot = false #repeat time
	timer.start()
	
	#the time it is not visible for
	disappear_timer = $"power-up Timer 3 (disappear)"
	disappear_timer.wait_time = 10 #10sec timer
	disappear_timer.one_shot = false # repeat time
	
	object_to_appear = $"power-up (rand) bg 3"
	object_to_appear.visible = false #in start invisible 

func _on_powerup_timer_3_appear_timeout():
	object_to_appear.visible = true 
	disappear_timer.start()
	
func _on_powerup_timer_3_disappear_timeout():
	object_to_appear.visible = false 
