if room=r_init {
	
	scr_getkey_setup()
	room_goto(r_gameplay_test)
	
	
	
}

if room=r_gameplay_test {
	
	instance_create_depth(20,140,-15999,o_multitouch)
	
}