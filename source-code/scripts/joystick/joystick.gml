function joystick(_joy, _touch=0){
	
	if instance_exists(_joy) switch _touch {
		case 0: return _joy._held
		case pressed: return _joy._pressed
		case released: return _joy._released
	}
	
	/*if instance_exists(o_multitouch) switch _joy {
		case "right": return o_joystick_right.touch
		case "left": return o_joystick_left.touch
		case "up": return o_joystick_up.touch
		case "down": return o_joystick_down.touch
	}*/
}

function scr_joystick_setup(){
	
	
	
}