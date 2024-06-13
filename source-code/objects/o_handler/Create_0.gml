show_debug_message(os_android)

if room=r_init {
	
	scr_getkey_setup()
	room_goto(r_gameplay_test)
	
	for (i=0;i<1024;i++) global.msg[i]=""
	
}

if room=r_gameplay_test {
	
	instance_create_depth(0,0,-14000,o_writer)
	
	
}

global.osflavor=os_type
global.aspectratio=display_get_width()/display_get_height()
instance_create_depth(20,140,-15999,o_control)

view_camera[0]=camera_create_view(0,0,427,240,0,noone,-1,-1,-1,-1)
_mouse_x = device_mouse_x_to_gui(0)/3*2
_mouse_y = device_mouse_y_to_gui(0)/3*2
_mouse_factor = 3