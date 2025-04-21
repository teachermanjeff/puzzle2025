extends Node2D

var x = 1
var _timer = null

func _ready():
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(30) #sets time to 30sec
	_timer.set_one_shot(false)
	_timer.start()
	
func _on_Timer_timeout():
	if x == 1:
		$ "LB power-up 2".visible = false #hide
		$ "LB power-up 2".stop()
		x+=1
		
	elif x==2:
		$ "LB power-up 2".visble = true #show
		$ "LB power-up 2".play()
		x-=1

	
