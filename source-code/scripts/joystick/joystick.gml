function joystick(_joy){
	
	switch _joy {
		case "right": return o_joystick_right.press
		case "left": return o_joystick_left.press
		case "up": return o_joystick_up.press
		case "down": return o_joystick_down.press
	}
}