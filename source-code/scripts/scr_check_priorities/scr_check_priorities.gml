function scr_check_priorities(){
	
	if getkey("right") and !getkey("left") {
		x_priority=1
		x_control=1
	}
	
	if !getkey("right") and getkey("left") {
		x_priority=-1
		x_control=-1
	}
	
	if !getkey("right") and !getkey("left") {
		x_priority=0
		x_control=0
	}
	
	if getkey("right") and getkey("left") x_control=-x_priority
	
	
	
	if getkey("down") and !getkey("up") {
		y_priority=1
		y_control=1
	}
	
	if !getkey("down") and getkey("up") {
		y_priority=-1
		y_control=-1
	}
	
	if !getkey("down") and !getkey("up") {
		y_priority=0
		y_control=0
	}
	
	if getkey("down") and getkey("up") y_control=-y_priority
	
}	