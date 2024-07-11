if room=r_init {
	
	room_goto(r_gameplay_test)
	
}

if room=r_gameplay_test {
	
	instance_create_depth(0,0,-14000,o_writer)
	global.game.menu=global.menus.pause
	
}

global.osflavor=os_type
global.aspectratio=display_get_width()/display_get_height()
instance_create_depth(20,140,-15980,o_control)

var _camera_width	=	427
var _camera_height	=	240
var _border_width	=	20
var _border_height	=	20

if instance_exists(o_chara) view_camera[0]=camera_create_view(0,0,_camera_width,_camera_height,0,o_chara,-1,-1,(_camera_width-_border_width)/2,(_camera_height-_border_height)/2)
else view_camera[0]=camera_create_view(0,0,_camera_width,_camera_height,0,noone,-1,-1,(_camera_width-_border_width)/2,(_camera_height-_border_height)/2)

_mouse_x = device_mouse_x_to_gui(0)/3*2
_mouse_y = device_mouse_y_to_gui(0)/3*2
_mouse_factor = 3

menu_lerp_speed=0.5

menu_alpha=0
menu_alpha_bg=0

lerp_speed=0.2

