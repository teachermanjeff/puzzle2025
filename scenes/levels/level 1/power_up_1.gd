extends Node2D

#variables
var timer = Time
var disappear_timer = Time
var object_to_appear =Node

func _ready() -> void:
	#the time it is visible for
	timer = $"power-up Timer 1 (appear)"
	timer.wait_time = 30 # 30sec timer
	timer.one_shot = false #repeat time
	timer.start()
	
	#the time it is not visible for
	disappear_timer = $"power-up Timer 1 (disappear)"
	disappear_timer.wait_time = 10 #10sec timer
	disappear_timer.one_shot = false #repeat timer
	
	object_to_appear = $"power-up (rand) bg 1"
	object_to_appear.visible = false #in start invisible 
	
	
func _on_powerup_timer_1_appear_timeout():
	object_to_appear.visible = true
	disappear_timer.start()

func _on_powerup_timer_1_disappear_timeout():
	object_to_appear.visible = false
