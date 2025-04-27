extends Node2D

var timer = Timer
var object_to_appear =Node

func _ready() -> void:
	timer = $"power-up Timer 1"
	timer.wait_time = 30 # 30sec timer
	timer.one_shot = false #repeat time
	movements_cd_l_1.attempts_left += 5
	print("extra_moves",extra_moves)
	timer.start()
	
	object_to_appear = $"power-up (rand) bg 1"
	object_to_appear.visible = false #in start invisible 
	
func _on_powerup_timer_1_timeout() -> void:
	object_to_appear.visible = true 
	
func _on_powerup_timer_1_appear_timeout():
	object_to_appear.visible = true
	disappear_timer.start()

func _on_powerup_timer_1_disappear_timeout():
	object_to_appear.visible = false
