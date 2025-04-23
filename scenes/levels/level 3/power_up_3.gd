extends Node2D

var timer = Timer
var disappear_timer = Time
var object_to_appear =Node

func _ready() -> void:
	timer = $"power-up Timer 3 (appear)"
	timer.wait_time = 120 # 120sec timer
	timer.one_shot = false #repeat time
	timer.start()
	
	disappear_timer = $"power-up Timer 3 (disappear)"
	disappear_timer.wait_time = 10 #10sec timer
	disappear_timer.one_shot = false
	
	object_to_appear = $"power-up (rand) bg 3"
	object_to_appear.visible = false #in start invisible 

func _on_powerup_timer_3_timeout() -> void:
	object_to_appear.visible = true 
	disappear_timer.start()
	

func _on_powerup_timer_3_disappear_timeout():
	object_to_appear.visible = false 
