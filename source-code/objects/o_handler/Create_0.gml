if room=r_init {
	
	room_goto(r_gameplay_test)
	
}

if room=r_gameplay_test {
	
	
	global.game.menu=global.menus.pause
	
	global.game.ost=audio_play_sound(ost_ruins,2,1,1,0,1.1)
	audio_pause_sound(global.game.ost)
}

global.osflavor=os_type
global.aspectratio=display_get_width()/display_get_height()
instance_create_depth(20,140,-15980,o_control)
instance_create_depth(0,0,depth,o_glitch)
instance_create_depth(0,0,depth+3,o_writer)

var _camera_width	=	427
var _camera_height	=	240
var _border_width	=	50
var _border_height	=	30

if instance_exists(o_chara) camera=camera_create_view(0,0,_camera_width,_camera_height,0,o_chara,-1,-1,(_camera_width-_border_width)/2,(_camera_height-_border_height)/2)
else camera=camera_create_view(0,0,_camera_width,_camera_height,0,noone,-1,-1,(_camera_width-_border_width)/2,(_camera_height-_border_height)/2)

view_camera[0]=camera

_mouse_x = device_mouse_x_to_gui(0)/3*2
_mouse_y = device_mouse_y_to_gui(0)/3*2
_mouse_factor = 3

menu_lerp_speed=0.5
selector_create=1

menu_alpha=0
menu_alpha_bg=0

lerp_speed=0.2

game_end_timer=0
game_end_timer_max=60