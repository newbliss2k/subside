global.menu={}
global.menu._selector=0
global.menu._selector_x_padding=25

function _global_menu_setup(){
	
	if !variable_instance_exists(self,"x_padding") x_padding=960
	if !variable_instance_exists(self,"y_padding") y_padding=500
	
	draw_set_font(font_normal24)
	if !variable_instance_exists(self,"y_string_h") y_string_h=string_height("A")*1.2
	
	if !variable_instance_exists(self,"accent_color") accent_color=c_white
	
	draw_set_font(font_normal24)
	draw_set_color(accent_color)
	draw_set_alpha(0.75)
	
	draw_set_alpha(1)
	
	if !variable_instance_exists(self,"title") title="Default title"
	if !variable_instance_exists(self,"title_y") title_y=150
	
	if !variable_instance_exists(self,"display_text") display_text=0
	if !variable_instance_exists(self,"display_text_y") display_text_y=0
	
	if !variable_instance_exists(self,"align") align=0
	
}

global.menu.main={}
with global.menu.main {
	
	options=
	[
		["New game",function _global_menu_main_new_game(){
			room_goto_ext(r_game_test)
			global.game.screen="pause"
		},],
		
		["Level select",function _global_menu_main_level_select(){
			array_push(global.game.screen_history,global.game.screen)
			global.game.screen="levels"
		},],
		
		["Settings",function _global_menu_main_settings(){
			array_push(global.game.screen_history,global.game.screen)
			global.game.screen="settings"
		},],
		
		["Read me",function _global_menu_main_info(){
			array_push(global.game.screen_history,global.game.screen)
			global.game.screen="info"
		},],
		
		["End Program",function _global_menu_main_endprogram(){
			game_end()
		},],
	]
	
	accent_color=c_white
	title="SURVEY_PROGRAM"
	
	_global_menu_setup()
	
	draw_set_font(font_normal24)
	var _w = string_width(options[global.menu._selector][0])
	
	if align=0 {
		global.menu._selector_x1=x_padding-_w/2-global.menu._selector_x_padding
		global.menu._selector_x2=x_padding+_w/2+global.menu._selector_x_padding
		align=0
	}
	else if align=-1 {
		global.menu._selector_x1=x_padding-global.menu._selector_x_padding
		global.menu._selector_x2=x_padding+global.menu._selector_x_padding+_w
		align=-1
	}
	
	global.menu._selector_y1=y_padding+(global.menu._selector+0)*y_string_h-5
	global.menu._selector_y2=y_padding+(global.menu._selector+1)*y_string_h-5
	
}