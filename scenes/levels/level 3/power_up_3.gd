extends Node2D

var timer = Timer
var object_to_appear =Node

func _ready() -> void:
	timer = $"power-up Timer 2"
	timer.wait_time = 120 # 120sec timer
	timer.one_shot = false #repeat time
	timer.start()
	
	object_to_appear = $"power-up (rand) bg 2"
	object_to_appear.visible = false #in start invisible 

func _on_powerup_timer_3_timeout() -> void:
	object_to_appear.visible = true 
