function scr_check_priorities(){
	
	gk_r=(getkey("right") or joystick("right"))
	gk_l=(getkey("left") or joystick("left"))
	gk_d=(getkey("down") or joystick("down"))
	gk_u=(getkey("up") or joystick("up"))
	
	if gk_r and !gk_l {
		x_priority=1
		x_control=1
	}
	
	if !gk_r and gk_l {
		x_priority=-1
		x_control=-1
	}
	
	if !gk_r and !gk_l {
		x_priority=0
		x_control=0
	}
	
	if gk_r and gk_l x_control=-x_priority
	
	
	
	if gk_d and !gk_u {
		y_priority=1
		y_control=1
	}
	
	if !gk_d and gk_u {
		y_priority=-1
		y_control=-1
	}
	
	if !gk_d and !gk_u {
		y_priority=0
		y_control=0
	}
	
	if gk_d and gk_u y_control=-y_priority
	
}	