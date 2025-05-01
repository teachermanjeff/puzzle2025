extends Node2D

#variables
var timer = Timer
var disappear_timer = Timer
var object_to_appear = Node
var extra_moves = Node
@onready var movements_cd_l_2: Label = $"../movements-CD-L2"

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
	
	object_to_appear = $"power-up (rand) bg 2"
	object_to_appear.visible = false #in start invisible 
	
func _on_powerup_timer_2_appear_timeout():
	object_to_appear.visible = true
	disappear_timer.start()
	movements_cd_l_2.attempts_left += 5
	print("extra_moves",extra_moves)

func _on_powerup_timer_2_disappear_timeout():
	object_to_appear.visible = false
