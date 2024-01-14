show_debug_message(os_android)

if room=r_init {
	
	scr_getkey_setup()
	room_goto(r_gameplay_test)
	
	for (i=0;i<1024;i++) global.msg[i]=""
	
}

if room=r_gameplay_test {
	
	//instance_create_depth(20,140,-15999,o_multitouch)
	
}

global.osflavor=os_type
global.aspectratio=display_get_width()/display_get_height()
instance_create_depth(20,140,-15999,o_control)